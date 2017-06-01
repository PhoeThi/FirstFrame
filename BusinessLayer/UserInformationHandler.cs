using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLayer
{
   public class UserInformationHandler
    {
       AddUserInformation addUserInfo = null;
       LoginUser loginuser = null;
       public  UserInformationHandler()
       {
           addUserInfo = new AddUserInformation();
           loginuser = new LoginUser();
       }
       public bool AddUserInformation(UserInformation userInfo)
       {
         return  addUserInfo.CreateUserInformation(userInfo);           
       }

       public bool GenerateUserPassword(UserInformation userInfo)
       {
           return addUserInfo.GenerateUserPassword(userInfo);
       }


       public bool CheckUserName(UserInformation userInfo)
       {
           return loginuser.CheckUserName(userInfo);
       }
       public bool CheckUserPassword(UserInformation userInfo)
       {
           return loginuser.CheckUserPassword(userInfo);
       }

       public bool LogonHistory(string email,bool isLogin)
       {
           return loginuser.LogonHistory(email);
       }

       public byte[] GetPhoto(string userName)
       {
           return addUserInfo.GetPhoto(userName);
       }
    }
}
