using APIWEB.Common;
using APIWEB.Models;
using APIWEB.Services;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using SelectPdf;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;


namespace APIWEB.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]

    public class MetricasController : Controller
    {
        
        private IMetricaservice _IMetricaservice;
        public MetricasController(IMetricaservice MetricaService)
            {
                  _IMetricaservice = MetricaService;

        }

      
            // GET: api/<MetricasController>
            /// <summary>
            /// Traer el total
            /// </summary>
            /// <returns></returns>
            [HttpGet("Total/")]
            [ProducesResponseType((int)HttpStatusCode.OK)]
            [ProducesResponseType((int)HttpStatusCode.BadRequest)]
            public object GetTotal()
            {
                return _IMetricaservice.GetTotal();
            }

        // GET: api/<MetricasController>
        /// <summary>
        /// traer las ventas
        /// </summary>
        /// <returns></returns>
        [HttpGet("Ventas/")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public DataTable GetSales()
        {

            return _IMetricaservice.GetSales();
        }

    }
 
}
