
using APIWEB.Models;
using APIWEB.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIWEB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private IAuthService _authService;
        public AuthController(IAuthService userInfoService)
        {
            _authService = userInfoService;
        }


        // POST api/<UsuarioController>
        /// <summary>
        /// Login
        /// </summary>
        /// <returns></returns>
        [HttpPost("Authenticate")]
        public IActionResult Authenticate([FromBody] AuthenticationModel model)
        {

            var user = _authService.Authenticate(model.usuario, model.contrasena );
            if (user.Result == null) return BadRequest(new { message = "Correo o contra incorrecto" });
            return Ok(user.Result);
          
        }


        /// <summary>
        /// Recuperar contraseña mediante correo elétronico (Api pública)
        /// </summary>
        /// <returns></returns>      
        [HttpGet("Contrasena")]
        public object RecuperarContrasenaUsuario(string Correo)
        {
            return _authService.RecuperarContrasenaUsuarios(Correo);             
        }
    }
}
