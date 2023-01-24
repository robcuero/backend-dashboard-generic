using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Tarjeta
    {
        [Key]
        public string idTarjeta { get; set; }

        public decimal total { get; set; }

        public decimal subtotal { get; set; }
        public decimal abono { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }

        public string telefono { get; set; }

        public string cedula { get; set; }

        public int id_Cliente { get; set; }

        public int id_Sector { get; set; }

        public List <int> id_Producto { get; set; }

        public string Message { get; set; }
    }
}

