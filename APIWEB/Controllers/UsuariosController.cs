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
    [Authorize]
    public class UsuariosController : ControllerBase
    {

        private IUsuarioService _UsuarioService;
        public UsuariosController(IUsuarioService userInfoService)
        {
            _UsuarioService = userInfoService;
        }


        // GET: api/<UsuariosController>
        /// <summary>
        /// Usuarios
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IEnumerable<Usuario> Get()
        {
            return _UsuarioService.Gets();
        }

        // GET api/<UsuariosController>/Profile
        /// <summary>
        /// Perfil del usuario logueado
        /// </summary>
        /// <returns></returns>
        [HttpGet("Profile")]

        public IActionResult Profile()
        {
            var IdUser = User.Claims.ToList()[0].Value; //Id

            var user = _UsuarioService.Profile(IdUser);
            return Ok(user.Result);
        }


        /// <summary>
        /// Registro
        /// </summary>
        /// <param name="obUsuario"></param>
        /// <returns></returns>
        //[AllowAnonymous]
        //[HttpPost("Register")]
        //public Registro Post([FromForm] Registro obUsuario)
        //{

        //    if (ModelState.IsValid) return _UsuarioService.Registro(obUsuario);
        //    return obUsuario;
        //}

        // GET api/<UsuariosController>/6
        /// <summary>
        /// Usuarios por id
        /// </summary>
        /// <param name="id">del app encriptado</param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public object Get(string id)
        {
            return _UsuarioService.Get(id);
        }

        // POST api/<UsuariosController>
        /// <summary>
        /// Ingresar y editar un usuario
        /// </summary>
        /// <param name="obUsuario"></param>
        /// <returns></returns>
        [HttpPost]
        public Usuario Post([FromForm] Usuario obUsuario)
        {

            if (ModelState.IsValid) return _UsuarioService.Save(obUsuario);
            return obUsuario;
        }

        // DELETE api/<UsuariosController>/5
        /// <summary>
        /// Eliminar un usuario por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// 
        [HttpDelete("{id}")]
        public object Delete(string id)
        {
            var IdUser =  User.Claims.ToList()[0].Value;

            if (IdUser == id)
            {
                return BadRequest();
            }
            else
            {
                return _UsuarioService.Delete(id);
            }
         
        }

        
    }
}
