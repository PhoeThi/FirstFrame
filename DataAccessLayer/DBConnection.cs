using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace DataAccessLayer
{
    public class DBConnection
    {


        private static SqlConnection scn = new SqlConnection(GetConnectionString());
        
        internal static string GetConnectionString()
        {
            string dbString = WebConfigurationManager.ConnectionStrings["DBString"].ConnectionString;
            return dbString;
        }

        internal static SqlConnection OpenConnection()
        {
            if (scn.State != ConnectionState.Open)
            {
                scn.Open();
            }
            return scn;
        }

        internal static SqlConnection CloseConnection()
        {
            if (scn.State == ConnectionState.Open)
            {
                scn.Close();
            }
            return scn;
        }
    }
}
