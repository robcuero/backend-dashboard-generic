using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Registro
    {
        [Key]
        public int IdUsuarios { get; set; }
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public string Telefono { get; set; }
        [Required, EmailAddress]
        public string Correo { get; set; }

        [Required]
        [JsonIgnore]
        public IFormFile FotoImg { get; set; }

        public string Foto { get; set; }

      
        public string Id_Tipo_Usuario { get; set; }


        [Required]
        [JsonIgnore]
        public string Password { get; set; }

        [Required]
        [JsonIgnore]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }

        public string Message { get; set; }
    }
}
