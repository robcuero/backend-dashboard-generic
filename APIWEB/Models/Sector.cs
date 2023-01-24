using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Sector
    {
        [Key]
        public string idSector { get; set; }

        public string nombre { get; set; }

        public string cobrador { get; set; }

        public string Message { get; set; }
    }
}

