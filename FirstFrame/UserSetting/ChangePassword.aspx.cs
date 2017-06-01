using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessLayer;
using BusinessLayer;

namespace FirstFrame.UserSetting
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    UserInformation userInformation = new UserInformation();
                    UserInformationHandler userHandler = new UserInformationHandler();
                    userInformation.Email = Session["UserName"].ToString().Trim();
                    byte[] image = (byte[])userHandler.GetPhoto(userInformation.Email);
                    string imageData = Convert.ToBase64String(image);
                    ImageUser.ImageUrl = "data:Image/png;base64," + imageData;
                }
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserInformation userInformation = new UserInformation();
            UserInformationHandler userHandler = new UserInformationHandler();
            userInformation.Password = txtOldpassword.Text;
            userInformation.Email = Session["UserName"].ToString().Trim();
            if (userHandler.CheckUserPassword(userInformation) == true)
            {
                if (txtnewpassword.Text.Trim() == txtconfirmpassword.Text.Trim())
                {
                    userInformation.Password = txtconfirmpassword.Text.Trim();
                    userHandler.GenerateUserPassword(userInformation);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else {
                txtOldpassword.Text = string.Empty;
                txtnewpassword.Text = string.Empty;
                txtconfirmpassword.Text = string.Empty;
                lblincortcurrentpassword.Text = "Current Password is not valid!";   
            }
        }
    }
}