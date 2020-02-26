using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                string personality = Session["Personality"].ToString();
                string[] pers = personality.Split(',');
                string trait0 = pers[1];
                string trait1 = pers[2];
                string trait2 = pers[3];
                string trait3 = pers[4];
                Label1.Text = trait0;
                Label2.Text = trait1;
                Label3.Text = trait2;
                Label4.Text = trait3;
                lblscore.Text = Session["TotalScore"].ToString();

                string uirWebAPI, exceptionMessage, webResponse;
                uirWebAPI = "https://behaveyourself.herokuapp.com/get_leaderboard";
                exceptionMessage = string.Empty;
                webResponse = Connection.Leaderboard(uirWebAPI, out exceptionMessage);
                string[] rankers = webResponse.Split(',');
                List<Ranker> my_list = new List<Ranker>();
                foreach (string ranker in rankers)
                {
                    string[] row = ranker.Split('-');
                    string rank = row[0].Trim();
                    string user_id = row[1].Trim();
                    string score = row[2].Trim();
                    Ranker rkr = new Ranker(rank, user_id, score);
                    my_list.Add(rkr);
                }
                GridView1.DataSource = my_list;
                GridView1.DataBind();
                Session.Abandon();
                Session.Clear();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void btn_login_click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Leaderboard.aspx");
        }
    }
}