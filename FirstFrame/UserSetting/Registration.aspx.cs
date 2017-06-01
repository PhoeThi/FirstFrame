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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {          
            UserInformation userInfo = new UserInformation();
            userInfo.FirstName = txtFirstName.Text;
            userInfo.LastName = txtLastName.Text;
            userInfo.Password = txtpassword.Text;
            userInfo.Email = txtEmail.Text;
            userInfo.Designation = txtDesignation.Text;
            userInfo.CompanyName = txtCompany.Text;
            userInfo.Gender = Convert.ToBoolean(radioGender.SelectedValue == ""?true:false);
            userInfo.BirthDate = DateTime.Parse(txtBirthDate.Text);
            userInfo.Photo = GenerateImage();
            UserInformationHandler userHandler = new UserInformationHandler();

            if (userHandler.AddUserInformation(userInfo) == true)
            {
                userHandler.GenerateUserPassword(userInfo);
                SendEmailActivation(userInfo.Email,userInfo.Password);
            }
            
        }
        
        protected void btnClear_Click(object sender, EventArgs e)
        {

        }


        private void SendEmailActivation(string userID,string password)
        {
            MailMessage mm = new MailMessage("earlybirds.org@gmail.com", userID);
            mm.Subject = "Account Activation";
            string body = "You can use . Account is activated now! and Account Password is " + password; // HTML code
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

        private byte[] GenerateImage()
        {
            byte[] image = null; 
            HttpPostedFile postedImage = this.imageUpload.PostedFile;
            string fileName = Path.GetFileName(postedImage.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedImage.ContentLength;
            string[] extension = { ".jpg", ".bmp", ".gif", ".png" };
            bool validFile = false;
            for (int i = 0; i < extension.Length; i++)
            {
                if (fileExtension == extension[i])
                {
                    validFile = true;
                }
            }
            if (validFile == true)
            {
                Stream stream = postedImage.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                image = bytes;
            }
            else { }
            return image;
        }
    }
}