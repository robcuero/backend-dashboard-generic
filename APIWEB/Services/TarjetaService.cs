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
 
        public interface ITarjetaService
    {

             Tarjeta Save(Tarjeta obTarjeta);
        //List<Sector> Gets();
        Tarjeta Edit(Tarjeta obTarjeta);
        List<object> GetsUserBySector(int idSector);
        Tarjeta Delete(string idTarget);
            //string Delete(string IdAplicaciones);


        }
        public class TarjetaService: ITarjetaService
    {
            public static IWebHostEnvironment _webHostEnvironment;
            private ICifrado _ICifradoService;

            Tarjeta _obTarjeta = new Tarjeta();
            List<Tarjeta> _obTarjetas = new List<Tarjeta>();
            public TarjetaService(IWebHostEnvironment webHostEnvironment, ICifrado Cifrado)
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


        public List<object> GetsUserBySector(int idSector)
        {

            List<object> _obLista = new List<object>();
 
            _obTarjeta = new Tarjeta()
            {
                id_Sector = idSector
            };
            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var _alls = con.Query<object>("dbo.crudTarjeta",this.SetParameters(_obTarjeta, (int)OperationType.Getbyid),
                                   commandType: CommandType.StoredProcedure).ToList();
                    
                if (_alls != null && _alls.Count() > 0)
                {
                    _obLista = _alls;
                }
            }

            return _obLista;


        }


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


        public Tarjeta Save(Tarjeta obTarjeta)
            {
                  _obTarjeta = new Tarjeta();
                try
                {

                    int operationType = Convert.ToInt32(obTarjeta.idTarjeta == null ? OperationType.Insert : OperationType.Update);
                    using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                    {

                        if (con.State == ConnectionState.Closed) con.Open();
                        var copyObject = con.Query<Tarjeta>("dbo.crudTarjeta", this.SetParameters(obTarjeta, operationType), commandType: CommandType.StoredProcedure);
                        if (copyObject != null && copyObject.Count() > 0)
                        {
                        _obTarjeta = copyObject.FirstOrDefault();
                        }
                    }

                _obTarjeta.Message = "ok";
            }
                catch (Exception ex)
                {
                     _obTarjeta.Message = ex.Message;
                }
                return _obTarjeta;


            }


        public Tarjeta Edit(Tarjeta obTarjeta)
        {
            obTarjeta.subtotal = obTarjeta.total - obTarjeta.abono;
            _obTarjeta = new Tarjeta();
            
            try
            {
                using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                {

                    if (con.State == ConnectionState.Closed) con.Open();
                    var copyObject = con.Query<Tarjeta>("dbo.crudTarjeta", this.SetParameters(obTarjeta, (int)OperationType.Update), commandType: CommandType.StoredProcedure);
                    if (copyObject != null && copyObject.Count() > 0)
                    {
                        _obTarjeta = copyObject.FirstOrDefault();
                    }
                }

                _obTarjeta.Message = "ok";
            }
            catch (Exception ex)
            {
                _obTarjeta.Message = ex.Message;
            }
            return _obTarjeta;


        }


        public Tarjeta Delete(string idTarget)
        {
            _obTarjeta = new Tarjeta();

            _obTarjeta.idTarjeta = idTarget;
            try
            {
                using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                {

                    if (con.State == ConnectionState.Closed) con.Open();
                    var copyObject = con.Query<Tarjeta>("dbo.crudTarjeta", this.SetParameters(_obTarjeta, (int)OperationType.Delete), commandType: CommandType.StoredProcedure);
                    if (copyObject != null && copyObject.Count() > 0)
                    {
                        _obTarjeta = copyObject.FirstOrDefault();
                    }
                }

                _obTarjeta.Message = "ok";
            }
            catch (Exception ex)
            {
                _obTarjeta.Message = ex.Message;
            }
            return _obTarjeta;


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


        private DynamicParameters SetParameters(Tarjeta tarjeta, int operationType)
            {
            DataTable productos = new DataTable();
            productos.Columns.Add("id_Producto", typeof(int));
            if (tarjeta.id_Producto != null)
            {
            
                foreach (var item in tarjeta.id_Producto)
                {
                    DataRow dr = productos.NewRow();
                    dr["id_Producto"] = item;
                    productos.Rows.Add(dr);
                }
            }
       

            DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@idTarjeta", tarjeta.idTarjeta);
                parameters.Add("@abono", tarjeta.abono);
                parameters.Add("@total", tarjeta.total);
                parameters.Add("@subtotal", tarjeta.subtotal);
                parameters.Add("@nombre", tarjeta.nombre);
                parameters.Add("@apellido", tarjeta.apellido);
                parameters.Add("@telefono", tarjeta.telefono);
                parameters.Add("@cedula", tarjeta.cedula);
                parameters.Add("@id_Cliente", tarjeta.id_Cliente);
                parameters.Add("@id_Sector", tarjeta.id_Sector);
                parameters.Add("@id_Producto", productos.AsTableValuedParameter("[dbo].[tarjeta_Producto]"));
                parameters.Add("@OperationType", operationType);
                return parameters;
            }

    }
    }

