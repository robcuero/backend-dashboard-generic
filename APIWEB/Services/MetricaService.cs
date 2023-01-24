using APIWEB.Common;
using APIWEB.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Services
{
    public interface IMetricaservice
    {

        public object GetTotal();

        DataTable GetSales();
    }

    public class MetricaService : IMetricaservice
    {



    

        public object GetTotal()
        {

            object _obArchivos = new object();
        

            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var _orchivos = con.Query<object>("dbo.metricas",
                                   this.SetParameters(0, (int)OperationType.Insert),
                                   commandType: CommandType.StoredProcedure).ToList();

                if (_orchivos != null && _orchivos.Count() > 0)
                {
                    _obArchivos = _orchivos;
                }
            }

            return _obArchivos;


        }


        public DataTable GetSales()
        {

            List<object> _obLista = new List<object>();
            List<object> _obLista2 = new List<object>();

            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var _alls = con.Query<object>("dbo.metricas", this.SetParameters(0, (int)OperationType.Update),
                                   commandType: CommandType.StoredProcedure).ToList();

                  var _month = con.Query<object>("dbo.metricas", this.SetParameters(0, (int)OperationType.Delete),
                                   commandType: CommandType.StoredProcedure).ToList();

            

   
                if (_alls != null && _alls.Count() > 0 )
                {
                    _obLista = _alls;

                    _obLista2 = _month;
                }



            }

            DataTable productos = new DataTable();
            productos.Columns.Add("total", typeof(string));
            productos.Columns.Add("subtotal", typeof(string));
            productos.Columns.Add("sector", typeof(string));
            productos.Columns.Add("cobrador", typeof(string));
            productos.Columns.Add("abonos", typeof(string));
            productos.Columns.Add("abonoMensual", typeof(string));

            foreach (dynamic item in _obLista)
            {
                DataRow dr = productos.NewRow();
                dr["total"] = item.total;
                dr["subtotal"] = item.subtotal;
                dr["sector"] = item.nombre;
                dr["abonos"] = item.abonos;
                dr["cobrador"] = item.cobrador;
                foreach (dynamic item2 in _obLista2)
                { if(item2.nombre == item.nombre)
                    dr["abonoMensual"] = item2.mensual;
                }
                productos.Rows.Add(dr);
            }

        



            return productos;


        }


        private DynamicParameters SetParameters(int id_Sector, int operationType)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@id_Sector", id_Sector);
            parameters.Add("@OperationType", operationType);
            return parameters;
        }
    }
}
