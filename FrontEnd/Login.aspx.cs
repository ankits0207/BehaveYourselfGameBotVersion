using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string user_name = txtuname.Text;
            string password = txtpwd.Text;
            string session_id = txtsessid.Text;

            string uirWebAPI, exceptionMessage, webResponse;
            uirWebAPI = "https://behaveyourself.herokuapp.com/login";
            exceptionMessage = string.Empty;
            webResponse = Connection.Login(uirWebAPI, user_name, password, session_id, out exceptionMessage);
            if(webResponse.Equals(user_name))
            {
                Session["user_name"] = user_name;
                Session["YourMove"] = '-';
                Session["OppMove"] = '-';
                Session["PrevScore"] = '-';
                Session["TotalScore"] = 0;
                Response.Redirect("Instructions1.aspx");
            }
            else
            {
                string predefined_response = "Message from admin: ";
                predefined_response = predefined_response + webResponse;
                lblmsg.Text = predefined_response;
            }
        }
    }
}