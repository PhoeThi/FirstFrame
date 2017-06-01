using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace DataAccessLayer
{
    public class RoomServiceRepository
    {
        public DataTable GetDataTable(string tableName)
        {
            DataTable dt = new DataTable();
            dt = SQLHelper.GetDataTable("select * From " + tableName);
            return dt;
        }
        public DataTable GetDataTable(string tableName, string condition)
        {
            DataTable dt = new DataTable();
            dt = SQLHelper.GetDataTable("select * From " + tableName + " where " + condition);
            return dt;
        }

        #region < Getting Data Using Function... Comment>

        //public static DataTable GetCity()
        //{
        //    return GetDataTable("[dbo].[GetCity]()");
        //}

        //public static DataTable GetTownship()
        //{
        //    return GetDataTable("Township");
        //}

        //public static DataTable GetTownship(string CityID)
        //{
        //    return GetDataTable("Townchip","CityID =" + CityID);
        //}

        //public static DataTable GetDecoratioin()
        //{
        //    return GetDataTable("Decoration");
        //}

        //public static DataTable GetPropertyType()
        //{
        //    return GetDataTable("select ID,Name From PropertyType");
        //}

        //public static DataTable GetFloor()
        //{
        //    return GetDataTable("select ID,FloorTh From RoomFloor");
        //}


        #endregion

        public object[] GetPropertiesValue(RoomServiceInformation roomInfo)
        {
            object[] roomInformation = { roomInfo.ID, roomInfo.Title, roomInfo.SaleRent, roomInfo.PropertyType, roomInfo.Width, roomInfo.Length, roomInfo.Sqrt, roomInfo.Floor, roomInfo.Currency, roomInfo.Price, roomInfo.Decoration, roomInfo.BedRoom, roomInfo.BathRoom, roomInfo.City, roomInfo.Township, roomInfo.ContactNumber, roomInfo.DetailInformation, roomInfo.FilePath, 
                                       roomInfo.PropertyTypeID,roomInfo.FloorID,roomInfo.DecorationID,roomInfo.BedRoomID,roomInfo.BathRoomID,roomInfo.CityID,roomInfo.TownshipID};
            return roomInformation;
        }
        public string[] GetParameters()
        {
            string[] roomParameters = { "@ID", "@Title", "@SaleRent", "@PropertyType", "@Width", "@Length", "@Sqrt", "@Floor", "@Currency", "@Price", "@Decoration", "@BedRoom", "@BathRoom", "@City", "@Township", "@ContactNumber", "@DetailInformation", "@FilePath" };
            return roomParameters;
        }

        public bool AddRoomService(object[] roomInformation)
        {
            object[] roomInfo = roomInformation; //GetPropertiesValue(roomInformation);
            string[] roompara = GetParameters();
            int paraCount = roomInfo.Length;
            SqlParameter[] para = new SqlParameter[paraCount-1];
            for (int i = 1; i < paraCount; i++)
            {
                para[i-1] = new SqlParameter(roompara[i], roomInfo[i]);
            }
            return SQLHelper.ExecStoreProcedure("AddRoomService", para);
        }

        public bool UpdateRoomService(object[] roomInformation)
        {
            object[] roomInfo = roomInformation;
            string[] roompara = GetParameters();
            int paraCount = roomInfo.Length;
            SqlParameter[] para = new SqlParameter[paraCount];
            for (int i = 0; i < paraCount; i++)
            {
                para[i] = new SqlParameter(roompara[i], roomInfo[i]);
            }
           return SQLHelper.ExecStoreProcedure("UpdateRoomService", para);
        }

        public List<RoomServiceInformation> GetRoomServiceList()
        {
            List<RoomServiceInformation> roomserviceList = null;
            
            DataTable dt = new DataTable();
            dt = GetDataTable("dbo.GetRoomService()");
            roomserviceList = new List<RoomServiceInformation>();

            string[] roompara = GetParameters();
            int paraCount = roompara.Length;
            foreach (DataRow row in dt.Rows)
            {
                RoomServiceInformation roomInfo = new RoomServiceInformation();
                roomInfo.ID = row["ID"].ToString();
                roomInfo.Title = row["Title"].ToString();
                roomInfo.SaleRent = row["SaleRent"].ToString();
                roomInfo.Width = float.Parse(row["Width"].ToString());
                roomInfo.PropertyType = row["PropertyType"].ToString();
                roomInfo.Length = float.Parse(row["Length"].ToString());
                roomInfo.Sqrt = float.Parse(row["Sqrt"].ToString());
                roomInfo.Floor = row["Floor"].ToString();
                roomInfo.Currency = row["Currency"].ToString();
                roomInfo.Price = Convert.ToDecimal(row["Price"].ToString());
                roomInfo.Decoration = row["Decoration"].ToString();
                roomInfo.BedRoom = row["BedRoom"].ToString();
                roomInfo.BathRoom = row["BathRoom"].ToString();
                roomInfo.City = row["City"].ToString();
                roomInfo.Township = row["Township"].ToString();
                roomInfo.ContactNumber = row["ContactNumber"].ToString();
                roomInfo.DetailInformation = row["DetailInformation"].ToString();
                roomInfo.FilePath = row["FilePath"].ToString();
                roomserviceList.Add(roomInfo);
            }
            return roomserviceList;
        }

        public object[] GetRoomService(string id)
        {
            DataTable dt = new DataTable();
            dt = GetDataTable("dbo.[GetRoomServiceOnId]('" + id + "')");
            RoomServiceInformation roomInfo = new RoomServiceInformation();
            object[] property = new object[50];
            property = GetPropertiesValue(roomInfo);
            int proCount = property.Length;
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < proCount; i++)
                {

                    property[i] = dt.Rows[0][i];
                }
                
            }
            return property;
        }

        public bool DeleteRoomService(string ID)
        {
            SqlParameter[] para = new SqlParameter[1];
            para[0] = new SqlParameter("@ID", ID);
            return SQLHelper.ExecStoreProcedure("DeleteRoomService", para);
        }

        public bool CopyRoomService(string ID)
        {
            SqlParameter[] para = new SqlParameter[1];
            para[0] = new SqlParameter("@ID", ID);
            return SQLHelper.ExecStoreProcedure("[CopyRoomService]", para);
        }
    }
}
