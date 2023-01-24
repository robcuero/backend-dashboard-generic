using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Cliente
    {
        [Key]
        public string idCliente { get; set; }

        public string nombre { get; set; }

        public string apellido { get; set; }

        public string cedula { get; set; }

        public string id_Sector { get; set; }

        public string Message { get; set; }
    }
}

