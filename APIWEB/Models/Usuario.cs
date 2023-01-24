using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class Usuario
    {
        [Key]
        public string idUsuarios { get; set; }
        [Required]
        public string nombre { get; set; }
        [Required]
        public string apellido { get; set; }
        [Required]
        public string telefono { get; set; }
        [Required, EmailAddress]
        public string correo { get; set; }

       // [Required]
        //[JsonIgnore]
        public string Password { get; set; }

        [JsonIgnore]
        public string Token { get; set; }

        public string Message { get; set; }
    }
}
