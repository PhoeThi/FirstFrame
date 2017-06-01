using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class Files
    {
        public string ID { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public int FileSize { get; set; }
        public string FileType { get; set; }
        public int TransactionID { get; set; }
        public string RelatedID { get; set; }

    }
}
