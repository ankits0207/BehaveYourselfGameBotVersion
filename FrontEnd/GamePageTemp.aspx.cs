using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["timer"] = 0;
                Session["limit"] = 20;
                if (Session["user_name"] != null)
                {
                    Session["user_name"].ToString();
                    string uirWebAPI, exceptionMessage, webResponse;
                    uirWebAPI = "https://behaveyourself.herokuapp.com/get_opponent";
                    exceptionMessage = string.Empty;
                    webResponse = Connection.GetOpponent(uirWebAPI, Session["user_name"].ToString(), out exceptionMessage);
                    string[] response = webResponse.Split(',');
                    string identifier = response[0];
                    if (webResponse.Equals("NotOk"))
                    {
                        Response.Write("<script>alert('Error: Unable to find opponent!');</script>");
                    }
                    else
                    {
                        if (identifier.Equals("-1"))
                        {
                            Session["Personality"] = webResponse;
                            uirWebAPI = "https://behaveyourself.herokuapp.com/end_game";
                            exceptionMessage = string.Empty;
                            webResponse = Connection.EndGame(uirWebAPI, Session["user_name"].ToString(), out exceptionMessage);
                            if (webResponse.Equals("Ok"))
                            {
                                Response.Redirect("ShowPersonality.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Error: Unable to end game!');</script>");
                            }
                        }
                        else
                        {
                            Session["opponent_name"] = identifier;
                            var random_names = new List<string>{
                                "black_mamba",
                                "pink_pineapple",
                                "blue_bear",
                                "silver_star",
                                "green_arrow",
                                "maroon_mystery",
                                "pink_puzzle",
                                "gray_godzilla",
                                "wandering_pony",
                                "trailblazer",
                                "orange_ostrich"};
                            Random rnd = new Random();
                            int index = rnd.Next(random_names.Count);
                            lblopponent.Text = random_names[index];
                            string[] set1 = response[1].Split('-');
                            Label1.Text = set1[0];
                            Label2.Text = set1[1];

                            string[] set2 = response[2].Split('-');
                            Label3.Text = set2[0];
                            Label4.Text = set2[1];

                            string[] set3 = response[3].Split('-');
                            Label5.Text = set3[0];
                            Label6.Text = set3[1];

                            string[] set4 = response[4].Split('-');
                            Label7.Text = set4[0];
                            Label8.Text = set4[1];
                            lbltotscore.Text = Session["TotalScore"].ToString();
                            String summary = "Your move: " + Session["YourMove"].ToString() + "\n";
                            summary = summary + ",     Opponent's move: " + Session["OppMove"].ToString() + "\n";
                            summary = summary + ",     You got: " + Session["PrevScore"].ToString();
                            lbl_summary.Text = summary;
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string move = rblaction.SelectedValue;
            string uirWebAPI, exceptionMessage, webResponse;
            uirWebAPI = "https://behaveyourself.herokuapp.com/eval_response";
            exceptionMessage = string.Empty;

            webResponse = Connection.EvalResponse(uirWebAPI, Session["user_name"].ToString(), Session["opponent_name"].ToString(), move,
                out exceptionMessage);
            if (webResponse.Equals("NotOk"))
            {
                Response.Write("<script>alert('Error: Unable to get score!');</script>");
            }
            else
            {
                string[] response = webResponse.Split('-');
                Session["PrevScore"] = response[0];
                Session["TotalScore"] = response[1];
                Session["YourMove"] = response[2];
                Session["OppMove"] = response[3];
                Response.Redirect("GamePageTemp.aspx");
            }
            //UpdatePanel1.Update();
        }
        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            lbltime.Text = (Convert.ToInt32(Session["limit"]) - Convert.ToInt32(Session["timer"])).ToString();
            Session["timer"] = Convert.ToInt32(Session["timer"]) + 1;
            if (Convert.ToInt32(Session["timer"]) >= Convert.ToInt32(Session["limit"]) + 1)
            {
                string uirWebAPI, exceptionMessage, webResponse;
                uirWebAPI = "https://behaveyourself.herokuapp.com/eval_response";
                exceptionMessage = string.Empty;
                string move = "-1";
                webResponse = Connection.EvalResponse(uirWebAPI, Session["user_name"].ToString(), Session["opponent_name"].ToString(), move,
                    out exceptionMessage);
                if (webResponse.Equals("NotOk"))
                {
                    Response.Write("<script>alert('Error: Unable to get score!');</script>");
                }
                else
                {
                    string[] response = webResponse.Split('-');
                    Session["PrevScore"] = response[0];
                    Session["TotalScore"] = response[1];
                    Session["YourMove"] = response[2];
                    Session["OppMove"] = response[3];
                    Response.Redirect("GamePageTemp.aspx");
                }
            }
            UpdatePanel1.Update();
        }

        protected void rblaction_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnsubmit.Visible = true;
            UpdatePanel2.Update();
        }

    }
}