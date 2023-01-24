using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Aplicacion_TipoUsuario
    {

        [Key]
        public int IdAplicaciontipos { get; set; }
        [Required]
        public string Id_Aplicacion { get; set; }
        [Required]
        public string Id_Tipo_Usuario { get; set; }

        public string Message { get; set; }
    }
}
