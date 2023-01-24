using APIWEB.Models;
using APIWEB.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIWEB.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class ClienteController : ControllerBase
    {
        private IClienteService _IClienteService;
        public ClienteController(IClienteService ClienteService)
        {
            _IClienteService = ClienteService;
        }


        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Cliente Post([FromForm] Cliente obCliente)
        {

            if (ModelState.IsValid) return _IClienteService.Save(obCliente);
            return obCliente;

        }

    }
}
