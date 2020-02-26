using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                lbluid.Text = Session["user_name"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btninstructions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instructions1.aspx");
        }

        protected void btnstart_Click(object sender, EventArgs e)
        {
            if(String.Equals(txtgameid.Text, "LetsPlayAgain"))
            {
                string uirWebAPI, exceptionMessage, webResponse;
                uirWebAPI = "https://behaveyourself.herokuapp.com/start_game";
                exceptionMessage = string.Empty;
                webResponse = Connection.start_game(uirWebAPI, Session["user_name"].ToString(), out exceptionMessage);
                if (webResponse.Equals("NotOk"))
                {
                    Response.Write("<script>alert('Unable to start game! Pls try again.');</script>");
                }
                else
                {
                    Response.Redirect("GamePageTemp.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid game id. Pls try again.');</script>");
            }
            
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Leaderboard.aspx");
        }
    }
}