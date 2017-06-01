using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Data;
using System.Data.SqlClient;


namespace BusinessLayer
{
    public class RoomServiceHandler
    {
        RoomServiceRepository roomRepo = null;
        public RoomServiceHandler()
        {
            roomRepo = new RoomServiceRepository();
        }

        public DataTable GetDataTable(string tableName)
        {
            return roomRepo.GetDataTable(tableName);
        }
        public DataTable GetDataTable(string tableName, string condition)
        {
            return roomRepo.GetDataTable(tableName, condition);
        }

       // public bool AddRoomServiceInformation(RoomServiceInformation roomInfo)
        public bool AddRoomServiceInformation(object[] roomInfo)
        {
            return roomRepo.AddRoomService(roomInfo);
        }

        public bool UpdateRoomService(object[] roomInfo)
        {
            return roomRepo.UpdateRoomService(roomInfo);
        }

        public bool DeleteRoomService(string ID)
        {
            return roomRepo.DeleteRoomService(ID);
        }
        public List<RoomServiceInformation> GetRoomServiceList()
        {
            return roomRepo.GetRoomServiceList();
        }

        public object[] GetRoomService(string id)
        {
            return roomRepo.GetRoomService(id);
        }

        public bool CopyRoomService(string ID)
        {
            return roomRepo.CopyRoomService(ID);
        }
    }
}
