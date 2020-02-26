using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm6 : System.Web.UI.Page
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
            gvrank.DataSource = my_list;
            gvrank.DataBind();
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void btnstart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}