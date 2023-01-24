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
 
        public interface IClienteService
    {

             Cliente Save(Cliente obCliente);
            //List<Sector> Gets();
            //Sector Get(string Api_Key);
            //string Delete(string IdAplicaciones);

        }
        public class ClienteService: IClienteService
    {
            public static IWebHostEnvironment _webHostEnvironment;
            private ICifrado _ICifradoService;

            Cliente _obCliente = new Cliente();
            List<Cliente> _obClientes = new List<Cliente>();
            public ClienteService(IWebHostEnvironment webHostEnvironment, ICifrado Cifrado)
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


            public Cliente Save(Cliente obCliente)
            {
                _obCliente = new Cliente();
                try
                {

                    int operationType = Convert.ToInt32(_obCliente.idCliente == null ? OperationType.Insert : OperationType.Update);
               

                    using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                    {

                        if (con.State == ConnectionState.Closed) con.Open();

                        var copyObject = con.Query<Cliente>("dbo.crudCliente", this.SetParameters(obCliente, operationType), commandType: CommandType.StoredProcedure);

                        if (copyObject != null && copyObject.Count() > 0)
                        {
                        _obCliente = copyObject.FirstOrDefault();
                        }
                    }
                }
                catch (Exception ex)
                {
                    _obCliente.Message = ex.Message;
                }
                return _obCliente;


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





            private DynamicParameters SetParameters(Cliente cliente, int operationType)
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@idCliente", cliente.idCliente);
                parameters.Add("@nombre", cliente.nombre);
                parameters.Add("@apellido", cliente.apellido);
                parameters.Add("@cedula", cliente.cedula);
                parameters.Add("@id_Sector", cliente.id_Sector);
                parameters.Add("@OperationType", operationType);
                return parameters;
            }
        }
    }

