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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = txtEmail.Text;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            UserInformation userInformation = new UserInformation();
            userInformation.Email = txtEmail.Text;
            userInformation.Password = RandomString();
            UserInformationHandler userHandler = new UserInformationHandler();
            userHandler.GenerateUserPassword(userInformation);
            SendEmailActivation(txtEmail.Text, userInformation.Password);
        }
        private void SendEmailActivation(string userID,string password)
        {
            MailMessage mm = new MailMessage("earlybirds.org@gmail.com", userID);
            mm.Subject = "Account Activation";
            string body = "You can use using this password. " + password; // HTML code
            mm.Body = body;
            mm.IsBodyHtml = true;
            using (SmtpClient smtp = new SmtpClient())
            {
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("earlybirds.org@gmail.com", "aRrLeeBirDOrGaNiZatiON");
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(mm);
            }
            
        }

        private static Random random = new Random();
        private static string RandomString()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%&";
            return new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}