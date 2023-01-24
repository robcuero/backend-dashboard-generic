using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class TipoUsuario
    {

        [Key]
        public int IdTipoUsuarios { get; set; }
        [Required]
        public string Tipo { get; set; }
        [Required]
        public string Entorno { get; set; }

        public string Id_Aplicacion { get; set; }
        public string Message { get; set; }

    }
}
