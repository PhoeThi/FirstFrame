using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using DataAccessLayer;
using BusinessLayer;


namespace FirstFrame.UserSetting
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                Session["UserName"] = null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserInformation userInformation = new UserInformation();
            userInformation.Email = txtEmail.Text;
            userInformation.Password = txtpassword.Text;
            UserInformationHandler userHandler = new UserInformationHandler();
            if (userHandler.CheckUserName(userInformation) == true)
            {
                if (userHandler.CheckUserPassword(userInformation) == true)
                {
                    bool isLogin = userHandler.LogonHistory(txtEmail.Text,true);
                    Session["UserName"] = txtEmail.Text;
                    Response.Redirect("ChangePassword.aspx");
                }
                else
                {
                    txtpassword.Text = "";
                    lblpassword.Text = "* Invalid Password!";
                    // Check for both Client and Server Date are correct or not
                }
            }
            else
            {
                txtEmail.Text = "";
                lblemail.Text = "* Invalid Email Address!";                
                // Check for both Client and Server Date are correct or not
            }
        }
    }
}