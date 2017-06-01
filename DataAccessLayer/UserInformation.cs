using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
  
    public class UserInformation
    {
        public string ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Designation { get; set; }
        public string CompanyName { get; set; }
        public bool Gender { get; set; }
        public DateTime BirthDate { get; set; }

        public byte[] Photo { get; set; }
    }
}
