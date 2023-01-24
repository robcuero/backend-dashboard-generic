using APIWEB.Models;
using APIWEB.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Net;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIWEB.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class TarjetaController : ControllerBase
    {
        private ITarjetaService _ITarjetaService;
        public TarjetaController(ITarjetaService TarjetaService)
        {
            _ITarjetaService = TarjetaService;
        }


        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Tarjeta Post([FromBody]Tarjeta obTarjeta)
        {

            if (ModelState.IsValid) return _ITarjetaService.Save(obTarjeta);
            return obTarjeta;

        }

        [HttpPost("/api/tarjeta/edit")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Tarjeta Edit([FromBody] Tarjeta obTarjeta)
        {

            if (ModelState.IsValid) return _ITarjetaService.Edit(obTarjeta);
            return obTarjeta;

        }

        [HttpGet("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public IEnumerable<object> GetsUserBySector(int id)
        {

            return _ITarjetaService.GetsUserBySector(id);
        }

        [HttpDelete("{id}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Tarjeta DeleteTargetById(string id)
        {

            return _ITarjetaService.Delete(id);
        }


    }
}
