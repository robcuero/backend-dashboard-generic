using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Models
{
    public class AuthenticationModel
    {

        [Required]
        public string usuario { get; set; }

        [Required]
        public string contrasena { get; set; }
    }
}
