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
 
        public interface ISectorService
        {

            Sector Save(Sector obSector);
        List<Sector> Gets();
            //List<Sector> Gets();
            //Sector Get(string Api_Key);
            //string Delete(string IdAplicaciones);

    }
        public class SectorService : ISectorService
    {
            public static IWebHostEnvironment _webHostEnvironment;
            private ICifrado _ICifradoService;

            Sector _obSector = new Sector();
            List<Sector> _obSectores = new List<Sector>();
            public SectorService(IWebHostEnvironment webHostEnvironment, ICifrado Cifrado)
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

        public List<Sector> Gets()
        {
            _obSectores = new List<Sector>();

            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var obAplicaciones = con.Query<Sector>("dbo.crudSector",
                                   this.SetParameters(_obSector, (int)OperationType.Get),
                                   commandType: CommandType.StoredProcedure).ToList();


                if (obAplicaciones != null && obAplicaciones.Count() > 0)
                {
                    _obSectores = obAplicaciones;

                }
            }
            return _obSectores;

        }


        public Sector Save(Sector obSector)
            {
            _obSector = new Sector();
                try
                {

                    int operationType = Convert.ToInt32(_obSector.idSector == null ? OperationType.Insert : OperationType.Update);
               

                    using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                    {

                        if (con.State == ConnectionState.Closed) con.Open();

                        var copyObject = con.Query<Sector>("dbo.crudSector", this.SetParameters(obSector, operationType), commandType: CommandType.StoredProcedure);

                        if (copyObject != null && copyObject.Count() > 0)
                        {
                        _obSector = copyObject.FirstOrDefault();
                        }
                    }
                }
                catch (Exception ex)
                {
                        _obSector.Message = ex.Message;
                }
                return _obSector;


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





            private DynamicParameters SetParameters(Sector sector, int operationType)
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@idSector", sector.idSector);
                parameters.Add("@nombre", sector.nombre);
                parameters.Add("@cobrador", sector.cobrador);
                parameters.Add("@OperationType", operationType);
                return parameters;
            }
        }
    }

