using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace DataAccessLayer
{
    class SQLHelper : DBConnection
    {
        internal static DataTable GetDataTable(string query)
        {
            SqlCommand cmd = new SqlCommand(query, OpenConnection());
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            CloseConnection();
            return dt;
        }

        internal static bool ExecStoreProcedure(string spName,SqlParameter[] parameters)
        {
            int result = 0;
            SqlCommand cmd = new SqlCommand(spName,OpenConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 3600;
            cmd.Parameters.AddRange(parameters);
            result = cmd.ExecuteNonQuery();
            CloseConnection();
            return (result > 0);
        }

        internal static void ExecuteSQLQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, OpenConnection());
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            CloseConnection();
        }

        internal static bool ExecuteStoreProcedureR(string spName, SqlParameter[] parameters,string outputName)
        {
            bool result = false ;
            SqlCommand cmd = new SqlCommand(spName, OpenConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 3600;
            cmd.Parameters.AddRange(parameters);
            cmd.Parameters[outputName].Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            result = Convert.ToBoolean(cmd.Parameters[outputName].Value);
            CloseConnection();
            return result;
        }

        internal static byte[] GetObject(string spName, SqlParameter[] para)
        {
            byte[] getObject = null;
            SqlCommand cmd = new SqlCommand(spName, OpenConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 3600;
            cmd.Parameters.AddRange(para);
            getObject = (byte[])cmd.ExecuteScalar();
            CloseConnection();
            return getObject;
        }


    }
}
