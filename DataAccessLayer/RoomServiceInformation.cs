using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class RoomServiceInformation
    {
        public string ID { get; set; }
        public string Title { get; set; }
        public string SaleRent { get; set; }
        public string PropertyType { get; set; }
        public float Width { get; set; }
        public float Length { get; set; }
        public float Sqrt { get; set; }
        public string Floor { get; set; }
        public string Currency { get; set; }
        public decimal Price { get; set; }
        public string Decoration { get; set; }
        public string BedRoom { get; set; }
        public string BathRoom { get; set; }
        public string City { get; set; }
        public string Township { get; set; }
        public string ContactNumber { get; set; }
        public string DetailInformation { get; set; }
        public string FilePath { get; set; }

        public string PropertyTypeID { get; set; }
        public string FloorID { get; set; }
        public string DecorationID { get; set; }
        public string BedRoomID { get; set; }
        public string BathRoomID { get; set; }
        public string CityID { get; set; }
        public string TownshipID { get; set; }
    }
}
