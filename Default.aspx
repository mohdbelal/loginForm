using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["message"]=="false")
        {
            lblErrorMessage.Text = "Invalid Usename & Password";
            lblErrorMessage.Visible = true;
            lblErrorMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(txtUserName.Text == "abc" && txtPassword.Text == "abc")
        {
            if (ckbRememberMe.Checked == true)
            {
                HttpCookie ck = new HttpCookie("Details");
                ck.Values["username"] = txtUserName.Text;
                ck.Values["password"] = txtPassword.Text;

                ck.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(ck);
               
            }
            Session["username"] = txtUserName.Text;
            Response.Redirect("HomePage.aspx");

        }
        else
        {
            Response.Redirect("Default.aspx?message="+"false");
        }
    }
}