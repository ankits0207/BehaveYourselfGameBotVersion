﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BehaveYourself
{
    public partial class WebForm3 : System.Web.UI.Page
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

        protected void btnprev_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instructions1.aspx");
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instructions3.aspx");
        }

        protected void btnskip_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main.aspx");
        }
    }
}