from flask import Flask, request, jsonify
import random
import numpy as np
import pickle
import time

app = Flask(__name__)

import pymongo

# connecting to the mongo client
client = pymongo.MongoClient(
    "mongodb+srv://shrebox:pass123@refresh2020-b0bfp.mongodb.net/test?retryWrites=true&w=majority")
db = client.get_database('refresh2020')  # connecting to refresh2020 database
database = db.get_collection('users')  # connecting to users collection
global_db = db.get_collection('global')  # global variable


# sample example for inserting a user
# users.insert(
#    ...: {"user_id":"user2",
#    ...: "password":"123",
#    ...: "variables":{"ingame":0,"available":1,"currentgame_no":1},
#    ...: "1":{"roundsplayed":1,"1":{"matrix":[[10,14],[7,5]],"move":"c","opp_id":"user1","opp_move":"c","reward":3},"personality":{"envious":1.0,"optimist":0.5,"pessimist":0.5,"trustful":0.6666666666666666}},
#    ...: "scores":[15]})

# sample update example
# users.update(
#    ...: {"_id":"user3"},
#    ...: { "$set": {"variables.ingame":1,"1.1.matrix.0.0":15}})

def create_temp_d_mongo():
    db = client.get_database('refresh2020')  # connecting to refresh2020 database
    users = db.get_collection('users')  # connecting to users collection

    # inserting sample user1
    users.insert({"_id": "user1", \
                  "password": "123", \
                  "variables": {"ingame": 0, "available": 0, "currentgame_no": 0}})  # , \
    # "1":{"roundsplayed":1,"1":{"matrix":[[10,10],[7,5]],"move":"c","opp_id":"user2","opp_move":"c","reward":5},"personality":{"envious":1.0,"optimist":0.5,"pessimist":0.5,"trustful":0.6666666666666666}},\
    # "scores":[42]})

    # inserting sample user2
    users.insert({"_id": "user2", \
                  "password": "456", \
                  "variables": {"ingame": 0, "available": 0, "currentgame_no": 0}})  # ,\
    # "1":{"roundsplayed":1,"1":{"matrix":[[10,14],[7,5]],"move":"c","opp_id":"user1","opp_move":"c","reward":3},"personality":{"envious":1.0,"optimist":0.5,"pessimist":0.5,"trustful":0.6666666666666666}},\
    # "scores":[15]})

    matches = []  # global variable

    access_flag = 0  # global variable

    robot_last_move = "c"

    return users, matches, access_flag, robot_last_move


# database,matches,access_flag, robot_last_move=create_temp_d_mongo()


@app.route('/')
def index():
    return '<h1>Check Heroku!</h1>'


@app.route("/login", methods=["POST"])
def login():
    request_json = request.get_json()
    global database
    uname_check = database.find({"_id": request_json['u_name']})
    uname_data = {}
    try:
        uname_data = uname_check[0]
    except:
        return "Invalid userid"
    if request_json['u_name'] == uname_data['_id'] and request_json['pwd'] == uname_data['password'] and request_json[
        'sess_id'] == '777':
        database.update({"_id": uname_data['_id']}, {"$set": {"variables.ingame": 0, "variables.available": 0}})
        return request_json['u_name']
    else:
        return 'Invalid details'


@app.route("/get_leaderboard", methods=["POST"])
def get_leaderboard():
    leaderboard = []
    database_keys = database.find()
    for i in database_keys:
        leaderboard.append([i["_id"], max(i["scores"])])

    leaderboard = sorted(leaderboard, key=lambda x: x[1], reverse=True)
    ranks = ""
    i = 0
    for u, s in leaderboard:
        i += 1
        ranks = ranks + str(i) + '-' + u + '-' + str(s) + ','
    return ranks[:-1]


# Before this both flags=0
# Send userid from front end
@app.route("/start_game", methods=["POST"])
def start_game():
    # Set available_flag = 1,   ingame = 0
    userid = request.get_json()['u_name']
    global database
    database.update({"_id": userid}, {"$inc": {"variables.currentgame_no": 1},
                                      "$set": {"variables.ingame": 0, "variables.available": 1}})
    temp = database.find({"_id": userid})
    curr_game = str(temp[0]['variables']['currentgame_no'])
    database.update({"_id": userid}, {"$set": {curr_game: {"roundsplayed": 0}}})
    return 'Ok'


def get_personality(user_dict):
    personality = dict()
    # % of optimist=average no. of cooperations in all rounds of user if T<R
    coop = [r for r in range(1, user_dict['roundsplayed'] + 1) if ('move' in user_dict[str(r)]) and (user_dict[str(r)]['move'] == 'c') and (
                user_dict[str(r)]['matrix'][1][0] < user_dict[str(r)]['matrix'][0][0])]
    valid_rounds = [r for r in range(1, user_dict['roundsplayed'] + 1) if
                    (user_dict[str(r)]['matrix'][1][0] < user_dict[str(r)]['matrix'][0][0]) and ('move' in user_dict[str(r)]) and (
                                user_dict[str(r)]['move'] != '-1')]
    if len(valid_rounds) == 0:
        personality['optimist'] = 0
    else:
        personality['optimist'] = round((len(coop) / len(valid_rounds)),2)*100
    # % of pessimist=average no. of cooperations in all rounds of user if S>P
    coop = [r for r in range(1, user_dict['roundsplayed'] + 1) if ('move' in user_dict[str(r)]) and (user_dict[str(r)]['move'] == 'c') and (
                user_dict[str(r)]['matrix'][0][1] > user_dict[str(r)]['matrix'][1][1])]
    valid_rounds = [r for r in range(1, user_dict['roundsplayed'] + 1) if
                    (user_dict[str(r)]['matrix'][0][1] > user_dict[str(r)]['matrix'][1][1]) and ('move' in user_dict[str(r)]) and (
                                user_dict[str(r)]['move'] != '-1')]
    if len(valid_rounds) == 0:
        personality['pessimist'] = 0
    else:
        personality['pessimist'] = round((len(coop) / len(valid_rounds)),2)*100
    # % of envious=average no. of cooperations in all rounds of user if S-T>=0
    coop = [r for r in range(1, user_dict['roundsplayed'] + 1) if ('move' in user_dict[str(r)]) and (user_dict[str(r)]['move'] == 'c') and (
                user_dict[str(r)]['matrix'][0][1] - user_dict[str(r)]['matrix'][1][0] >= 0)]
    valid_rounds = [r for r in range(1, user_dict['roundsplayed'] + 1) if
                    (user_dict[str(r)]['matrix'][0][1] - user_dict[str(r)]['matrix'][1][0] >= 0) and ('move' in user_dict[str(r)]) and (
                                user_dict[str(r)]['move'] != '-1')]
    if len(valid_rounds) == 0:
        personality['envious'] = 0
    else:
        personality['envious'] = round((len(coop) / len(valid_rounds)),2)*100
    # % of trustful=average no. of cooperations in all rounds of user
    coop = [r for r in range(1, user_dict['roundsplayed'] + 1) if ('move' in user_dict[str(r)]) and (user_dict[str(r)]['move'] == 'c')]
    valid_rounds = [r for r in range(1, user_dict['roundsplayed'] + 1) if ('move' in user_dict[str(r)]) and (user_dict[str(r)]['move'] != '-1')]
    if len(valid_rounds) == 0:
        personality['trustful'] = 0
    else:
        personality['trustful'] = round((len(coop) / len(valid_rounds)),2)*100
    return personality


@app.route("/end_game", methods=["POST"])
def end_game():
    # Set available_flag = 0, ingame_flag = 0
    userid = request.get_json()['u_name']
    global database
    database.update({"_id": userid}, {"$set": {"variables.ingame": 0, "variables.available": 0, }})
    return 'Ok'


def get_matrix():
    P = 5
    R = 10
    S = np.random.randint(low=0, high=11)
    T = np.random.randint(low=5, high=16)
    matrix = np.array([[R, S], [T, P]])
    if S > P and T < R:
        matrix_name = "HG"
    elif T > R and R > S & S > P:
        matrix_name = "SG"
    elif T < R and T > P & S < P:
        matrix_name = "SH"
    elif T > R and R > P and P > S:
        matrix_name = "PD"
    elif S == 10 or S == 0 or T == 5 or T == 15:
        matrix_name = "outside boundary"
    elif S == 5 or T == 10:
        matrix_name = "center boundary"
    else:
        matrix_name = "Invalid"
    return matrix_name, matrix


# *** Ensure serial execution for this part
# Execute the code below only if access_flag == 0
# Set access_flag = 1
# Check for a pre-existing match in the database, if available, set access_flag=0 and return user_id, matrix
# else if unavailable, then first find an opponent with available_flag = 1, ingame_flag = 0
# Set available_flag = 0, ingame_flag = 1 for both the players
# Sample a matrix
# Add a match to database (Match=userid1-userid2-matrix)
# Set access flag = 0
# Return opponent's userid, matrix

@app.route("/get_opponent", methods=["POST"])
def get_opponent():
    userid = request.get_json()['u_name']
    user_data = database.find({"_id": userid})
    user_data = user_data[0]
    try:
        no_rounds_played = user_data[str(user_data['variables']['currentgame_no'])]['roundsplayed']
        if no_rounds_played < 12:
            allocate = 1
        elif no_rounds_played >= 12:
            allocate = 0
        else:
            allocate = np.random.randint(low=0, high=2)
        #if no_rounds_played > 3:
        #    if (user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played)]['move'] == "-1") and \
        #            (user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played - 1)]['move'] == "-1") \
        #            and (
        #            user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played - 2)]['move'] == "-1"):
        #        allocate = 0
        if allocate == 1:
            oppid = 'robot'
            mat = get_matrix()[1]
            game_no = user_data['variables']['currentgame_no']
            game_no_roundsplayed_key = str(game_no) + ".roundsplayed"
            database.update({"_id": userid}, {"$inc": {game_no_roundsplayed_key: 1}})
            curr_round = user_data[str(game_no)]['roundsplayed']
            curr_round += 1
            curr_round_update = str(user_data['variables']['currentgame_no']) + "." + str(curr_round)
            database.update({"_id": userid}, {"$set": {curr_round_update: {}}})

            update_str1 = curr_round_update + ".matrix"
            update_str2 = curr_round_update + ".opp_id"
            update_str3 = curr_round_update + ".start_time"
            database.update({"_id": userid},
                            {"$set": {update_str1: mat.tolist(), update_str2: oppid, update_str3: time.time()}})
            if curr_round == 1:
                prev_score = 0
            else:
                #shashee
                prev_score=np.sum(user_data[str(game_no)][str(round)]['reward'] for round in range(1,curr_round) if 'reward' in user_data[str(game_no)][str(round)])
    
            return oppid + ',' + str(mat[0][0]) + '-' + str(mat[0][0]) + ',' + str(mat[0][1]) + '-' + str(
                mat[1][0]) + ',' + str(mat[1][0]) + '-' + str(mat[0][1]) + ',' + str(mat[1][1]) + '-' + str(
                mat[1][1]) + ',' + str(prev_score)
        else:
            game_no = user_data['variables']['currentgame_no']
            game_no_key = str(game_no)
            curr_round = user_data[game_no_key]['roundsplayed']
            personality = get_personality(user_data[game_no_key])
            database.update({"_id": userid}, {"$set": {"personality": personality}})
            score = np.sum(user_data[str(game_no)][str(round)]['reward'] for round in range(1,curr_round+1) if 'reward' in user_data[str(game_no)][str(round)])	
            database.update({"_id": userid}, {"$push": {"scores": int(score)}})
            return '-1,' + str(personality['optimist']) + ',' + str(personality['pessimist']) + ',' + str(
                personality['envious']) + ',' + str(personality['trustful']) + ',' + str(score)
    except:
        no_rounds_played = user_data[str(user_data['variables']['currentgame_no'])]['roundsplayed']
        if no_rounds_played < 12:
            allocate = 1
        elif no_rounds_played >= 12:
            allocate = 0
        else:
            allocate = np.random.randint(low=0, high=2)
        #if no_rounds_played > 3:
        #    if (user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played)]['move'] == "-1") and \
        #            (user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played - 1)][
        #                 'move'] == "-1") \
        #            and (
        #            user_data[str(user_data['variables']['currentgame_no'])][str(no_rounds_played - 2)][
        #                'move'] == "-1"):
        #       allocate = 0
        if allocate == 1:
            oppid = 'robot'
            mat = get_matrix()[1]
            game_no = user_data['variables']['currentgame_no']
            curr_round = user_data[str(game_no)]['roundsplayed']
            curr_round += 1
            if curr_round == 1:
                prev_score = 0
            else:
                #shashee
                prev_score = np.sum(user_data[str(game_no)][str(round)]['reward'] for round in range(1,curr_round) if 'reward' in user_data[str(game_no)][str(round)])
            return oppid + ',' + str(mat[0][0]) + '-' + str(mat[0][0]) + ',' + str(mat[0][1]) + '-' + str(
                mat[1][0]) + ',' + str(mat[1][0]) + '-' + str(mat[0][1]) + ',' + str(mat[1][1]) + '-' + str(
                mat[1][1]) + ',' + str(prev_score)
        else:
            game_no = user_data['variables']['currentgame_no']
            game_no_key = str(game_no)
            curr_round = user_data[game_no_key]['roundsplayed']
            personality = get_personality(user_data[game_no_key])
            #shashee
            score = np.sum(user_data[str(game_no)][str(round)]['reward'] for round in range(1,curr_round + 1) if 'reward' in user_data[str(game_no)][str(round)])
            return '-1,' + str(personality['optimist']) + ',' + str(personality['pessimist']) + ',' + str(
                personality['envious']) + ',' + str(personality['trustful']) + ',' + str(score)


def calculate_reward(matrix, move, opp_move):
    if move == '-1':
        return 0
    i = 0 if move == 'c' else 1
    j = 0 if opp_move == 'c' else 1
    return matrix[i][j]


@app.route("/eval_response", methods=["POST"])
def eval_response():
    try:
        userid = request.get_json()['u_name']
        move = request.get_json()['move']
        user_data = database.find({"_id": userid})
        user_data = user_data[0]
        game_no = user_data['variables']['currentgame_no']
        game_no_key = str(game_no)
        curr_round = user_data[game_no_key]['roundsplayed']
        update_key = game_no_key + "." + str(curr_round) + ".move"
        update_key2 = game_no_key + "." + str(curr_round) + ".response_time"
        start_time = user_data[game_no_key][str(curr_round)]['start_time']
        database.update({"_id": userid}, {"$set": {update_key: move, update_key2: time.time() - start_time}})
        roundsplayed_key = str(curr_round)
        mat = user_data[game_no_key][roundsplayed_key]['matrix']
        curr_round_key = str(curr_round)
        opp_move = get_move_bot(move)
        reward = calculate_reward(mat, move, opp_move)
        update_key1 = game_no_key + "." + curr_round_key + ".opp_move"
        update_key2 = game_no_key + "." + curr_round_key + ".reward"
        database.update({"_id": userid}, {"$set": {update_key1: opp_move, update_key2: reward}})
        if move == 'c':
            move = 'Cooperate'
        elif move == '-1':
            move = 'Time ran out'
        elif move == 'd':
            move = 'Dont cooperate'
        else:
            move = 'Something is wrong'
        if opp_move == 'c':
            opp_move = 'Cooperate'
        elif opp_move == '-1':
            opp_move = 'Time ran out'
        elif opp_move == 'd':
            opp_move = 'Dont cooperate'
        else:
            opp_move = 'Something is wrong'
        user_data = database.find({"_id": userid})
        user_data = user_data[0]
        #shashee
        total_score = np.sum(user_data[game_no_key][str(round)]['reward'] for round in range(1, curr_round + 1) if 'reward' in user_data[game_no_key][str(round)])
        return str(reward) + '-' + str(total_score) + '-' + move + '-' + opp_move
    except:
        userid = request.get_json()['u_name']
        move = request.get_json()['move']
        opp_move = get_move_bot(move)
        user_data = database.find({"_id": userid})
        user_data = user_data[0]
        game_no = user_data['variables']['currentgame_no']
        game_no_key = str(game_no)
        curr_round = user_data[game_no_key]['roundsplayed']
        roundsplayed_key = str(curr_round)
        mat = user_data[game_no_key][roundsplayed_key]['matrix']
        reward = calculate_reward(mat, move, opp_move)
        if move == 'c':
            move = 'Cooperate'
        elif move == '-1':
            move = 'Time ran out'
        elif move == 'd':
            move = 'Dont cooperate'
        else:
            move = 'Something is wrong'
        if opp_move == 'c':
            opp_move = 'Cooperate'
        elif opp_move == '-1':
            opp_move = 'Time ran out'
        elif opp_move == 'd':
            opp_move = 'Dont cooperate'
        else:
            opp_move = 'Something is wrong'
        user_data = database.find({"_id": userid})
        user_data = user_data[0]
        #shashe
        total_score = np.sum(user_data[game_no_key][str(round)]['reward'] for round in range(1, curr_round + 1) if 'reward' in user_data[game_no_key][str(round)])
        return str(reward) + '-' + str(total_score) + '-' + move + '-' + opp_move


def get_move_bot(move):
    # robot_last_move=global_db.find()[0]['robot_last_move']
    rand = np.random.rand()
    options=[0.5,0.37,0.8]
    p=random.choice(options)
    if rand <= p:
        return move
    else:
        if move == 'c':
            return "d"
        else:
            return "c"


if __name__ == '__main__':
    app.run(debug=True)

#### Errors:
# 1# If user1 and user2 have started the game
#### user1 does get_opponent and gets assigned to user2
#### user1 then goes on to eval_reponse but user2 hasn't yet pressed get_opponont, so current round not updated, gives problem
# 2# What do you do when user1 doesnt respond and robot insted takes over?
#### do we decrement rounds played, remove round etc.?
# 3# access_flag optimize
# 4 Timer negative at front end when player/opponent does not respond within time.(Frequency - Always)
# 5 After rounds are over, login page displayed instead of personality page.(Frequency - Once)
# 6 Opponent assignment issue. One player assigned as opponent to other player but other player playing with robot.(Frequency- Sometimes)
# 7 Rounds allocated exceeding the maximum limit (3 during testing) (Frequency - Sometimes)
# 8 Player getting points even if he/she doesn't make a move
# 9 consistent entry of moves in player and opponent's db

