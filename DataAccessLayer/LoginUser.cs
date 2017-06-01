using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class LoginUser
    {

        public bool CheckUserPassword(UserInformation userInfo)
        {
            SqlParameter[] para = new SqlParameter[3];
            para[0] = new SqlParameter("@UserEmail", userInfo.Email);
            para[1] = new SqlParameter("@UserTypedPassword", userInfo.Password);
            para[2] = new SqlParameter("@Flag", 0);
            return SQLHelper.ExecuteStoreProcedureR("[GetUserPassword]", para,"@Flag");
        }

        public bool CheckUserName(UserInformation userInfo)
        {
            SqlParameter[] para = new SqlParameter[2];
            para[0] = new SqlParameter("@UserName", userInfo.Email);
            para[1] = new SqlParameter("@Flag", false);
            return SQLHelper.ExecuteStoreProcedureR("[CheckUserName]", para, "@Flag");

        }

        public bool LogonHistory(string email)
        {
            SqlParameter[] para = new SqlParameter[2];
            para[0] = new SqlParameter("@Email", email);
            para[1] = new SqlParameter("@isLogin", true);
            return SQLHelper.ExecStoreProcedure("[LogonHistory]", para);
        }
    }
}
