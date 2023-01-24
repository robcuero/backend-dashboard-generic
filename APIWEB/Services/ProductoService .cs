using APIWEB.Common;
using APIWEB.Helpers;
using APIWEB.Models;
using Dapper;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Services
{
 
        public interface IProductoService
    {

            Producto Save(Producto obSector);
            //List<Sector> Gets();
            //Sector Get(string Api_Key);
            //string Delete(string IdAplicaciones);

        }
        public class ProductoService: IProductoService
    {
            public static IWebHostEnvironment _webHostEnvironment;
            private ICifrado _ICifradoService;

            Producto _obProducto = new Producto();
            List<Producto> _obProductos = new List<Producto>();
            public ProductoService(IWebHostEnvironment webHostEnvironment, ICifrado Cifrado)
            {
                _webHostEnvironment = webHostEnvironment;
                _ICifradoService = Cifrado;
            }



            //public string Delete(string IdAplicaciones)
            //{
            //    _obAplicacion = new Aplicacion();
            //    string message = "";
            //    try
            //    {
            //        _obAplicacion.IdAplicaciones = _ICifradoService.Desencriptar(IdAplicaciones);
            //        using IDbConnection con = new SqlConnection(ConectionString.cnx);
            //        if (con.State == ConnectionState.Closed) con.Open();
            //        var obAplicaciones = con.Query<Aplicacion>("dbo.aplicacion",

            //            this.SetParameters(_obAplicacion, (int)OperationType.Delete),
            //            commandType: CommandType.StoredProcedure);
            //        if (obAplicaciones != null && obAplicaciones.Count() > 0)
            //        {
            //            _obAplicacion = obAplicaciones.FirstOrDefault();
            //        }
            //    }
            //    catch (Exception ex)
            //    {

            //        message = ex.Message;
            //    }
            //    return message;
            //}


            //public Aplicacion Get(string Api_Key)
            //{
            //    _obAplicacion = new Aplicacion();

            //    try
            //    {
            //        //_obAplicacion.IdAplicaciones = _ICifradoService.Desencriptar(IdAplicaciones);
            //        _obAplicacion.Api_key = Api_Key;
            //        using IDbConnection con = new SqlConnection(ConectionString.cnx);

            //        if (con.State == ConnectionState.Closed) con.Open();
            //        var obAplicaciones = con.Query<Aplicacion>("dbo.aplicacion",
            //            this.SetParameters(_obAplicacion, (int)OperationType.Getbyid),
            //            commandType: CommandType.StoredProcedure);

            //        if (obAplicaciones != null && obAplicaciones.Count() > 0)
            //        {
            //            _obAplicacion = obAplicaciones.SingleOrDefault();
            //        }

            //    }
            //    catch (Exception ex)
            //    {

            //        _obAplicacion.Message = ex.Message;
            //    }

            //    return _obAplicacion;
            //}

            //public List<Aplicacion> Gets()
            //{
            //    _obAplicaciones = new List<Aplicacion>();

            //    using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            //    {
            //        if (con.State == ConnectionState.Closed) con.Open();
            //        var obAplicaciones = con.Query<Aplicacion>("dbo.aplicacion",
            //                           this.SetParameters(_obAplicacion, (int)OperationType.Get),
            //                           commandType: CommandType.StoredProcedure).ToList();


            //        if (obAplicaciones != null && obAplicaciones.Count() > 0)
            //        {
            //            _obAplicaciones = obAplicaciones;
            //            _obAplicaciones.Select(a =>
            //            {
            //                a.IdAplicaciones = _ICifradoService.Encriptar(a.IdAplicaciones);
            //                return _obAplicaciones;
            //            }).ToList();

            //        }
            //    }
            //    return _obAplicaciones;

            //}


            public Producto Save(Producto obProducto)
            {
               _obProducto = new Producto();
                try
                {

                    int operationType = Convert.ToInt32(_obProducto.idProducto == null ? OperationType.Insert : OperationType.Update);
               

                    using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                    {

                        if (con.State == ConnectionState.Closed) con.Open();

                        var copyObject = con.Query<Producto>("dbo.crudProducto", this.SetParameters(obProducto, operationType), commandType: CommandType.StoredProcedure);

                        if (copyObject != null && copyObject.Count() > 0)
                        {
                        _obProducto = copyObject.FirstOrDefault();
                        }
                    }
                }
                catch (Exception ex)
                {
                     _obProducto.Message = ex.Message;
                }
                return _obProducto;


            }


            //public Aplicacion SaveImg(Aplicacion obAplicacion)
            //{
            //    _obAplicacion = new Aplicacion();
            //    try
            //    {



            //        obAplicacion.IdAplicaciones = _ICifradoService.Desencriptar(obAplicacion.IdAplicaciones);


            //        using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            //        {

            //            if (con.State == ConnectionState.Closed) con.Open();
            //            obAplicacion.Logo = Guardarlogo(obAplicacion.LogoImg);
            //            var obAplicaciones = con.Query<Aplicacion>("dbo.aplicacion", this.SetParameters(obAplicacion, 6), commandType: CommandType.StoredProcedure);

            //            if (obAplicaciones != null && obAplicaciones.Count() > 0)
            //            {
            //                _obAplicacion = obAplicaciones.FirstOrDefault();
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {

            //        _obAplicacion.Message = ex.Message;
            //    }
            //    return _obAplicacion;


            //}



            //public string Guardarlogo(IFormFile img)
            //{
            //    string NombreLogo = new String(Path.GetFileNameWithoutExtension(img.FileName).Take(10).ToArray()).Replace(" ", "-");

            //    NombreLogo = NombreLogo + DateTime.Now.ToString("yymmssff") + Path.GetExtension(img.FileName);
            //    var ruta = Path.Combine(_webHostEnvironment.ContentRootPath, "Files", NombreLogo);
            //    using (var stream = new FileStream(ruta, FileMode.Create))
            //    {
            //        img.CopyTo(stream);
            //    }
            //    return NombreLogo;
            //}





            private DynamicParameters SetParameters(Producto producto, int operationType)
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@idProducto", producto.idProducto);
                parameters.Add("@nombre", producto.nombre);
                parameters.Add("@precio", producto.precio);
                parameters.Add("@descripcion", producto.descripcion);
                parameters.Add("@OperationType", operationType);
                return parameters;
            }
        }
    }

