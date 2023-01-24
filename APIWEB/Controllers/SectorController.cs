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
    public class SectorController : ControllerBase
    {
        private ISectorService _ISectorService;
        public SectorController(ISectorService Sectorervice)
        {
            _ISectorService = Sectorervice;
        }


        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Sector Post([FromBody] Sector obSector)
        {

            if (ModelState.IsValid) return _ISectorService.Save(obSector);
            return obSector;

        }

        [HttpGet()]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public IEnumerable<Sector> Get()
        {
            return _ISectorService.Gets();
        }

    }
}
