using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DataAccessLayer
{
    public class AddUserInformation 
    {
        
        public object[] GetPropertiesValue(UserInformation userInfo)
        {
            object[] usrInfo = { userInfo.ID, userInfo.FirstName, userInfo.LastName, userInfo.Email, userInfo.Password, userInfo.Designation, userInfo.CompanyName, userInfo.Gender, userInfo.BirthDate, userInfo.Photo};
             return usrInfo;
        }

        public string[] GetParameters()
        {
            string[] userpara = { "@ID", "@FirstName", "@LastName", "@Email", "@Password", "@Designation", "@CompanyName", "@Gender", "@BirthDate","@photo" };
            return userpara;
        }
        public bool CreateUserInformation(UserInformation userInfo)
        {
            object[] usrInfo = GetPropertiesValue(userInfo);
            string[] userpara = GetParameters();
             int paraCount = usrInfo.Length;
             SqlParameter[] para = new SqlParameter[paraCount-1];             
            for (int i = 1; i < paraCount; i++)
			{
                //para[i] = new SqlParameter(userpara[i], usrInfo[i].GetType());
                //para[i].Value = usrInfo[i];
                para[i-1] = new SqlParameter(userpara[i], usrInfo[i]);
			}
           return SQLHelper.ExecStoreProcedure("CreateUserInformation", para);
        }

        public bool GenerateUserPassword(UserInformation userInfo)
        {

            SqlParameter[] para = new SqlParameter[2];
            para[0] = new SqlParameter("@Email", userInfo.Email);
            para[1] = new SqlParameter("@UserPassword", userInfo.Password);  
            return SQLHelper.ExecStoreProcedure("[SetUserPassword]", para);
        }
        public void UpdateUserInformation(UserInformation userInfo)
        {
            object[] usrInfo = GetPropertiesValue(userInfo);
            string[] userpara = GetParameters();
            int paraCount = usrInfo.Length;
            SqlParameter[] para = new SqlParameter[paraCount];
            for (int i = 0; i < paraCount; i++)
            {
                para[i] = new SqlParameter(userpara[i], usrInfo[i]);
            }
            SQLHelper.ExecStoreProcedure("UpdateUserInformation", para);
        }

        public void DeleteUserInformation(string ID)
        {

            string[] userpara = GetParameters();
            SqlParameter[] para = new SqlParameter[1];
            para[0] = new SqlParameter("@ID", ID); 
            SQLHelper.ExecStoreProcedure("DeleteUserInformation", para);
        }

        public byte[] GetPhoto(string userName)
        {
            byte[] image = null; 
            string[] userPara = GetParameters();
            SqlParameter[] para = new SqlParameter[1];
            para[0] = new SqlParameter("@userName", userName);
            image = ((byte[])SQLHelper.GetObject("GetPhoto", para));
            return image;
        }
    }
}
