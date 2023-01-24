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
    public class ProductoController : ControllerBase
    {
        private IProductoService _IProductoService;
        public ProductoController(IProductoService ProductoService)
        {
            _IProductoService = ProductoService;
        }


        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public Producto Post([FromForm] Producto obProducto)
        {

            if (ModelState.IsValid) return _IProductoService.Save(obProducto);
            return obProducto;

        }

    }
}
