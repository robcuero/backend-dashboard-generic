using APIWEB.Common;
using APIWEB.Helpers;
using APIWEB.Models;
using Dapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Services
{
    public interface IUsuarioService
    {
        List<Usuario> Gets();
        Object Get(string id);
        Task<Usuario> Profile(string IdUsuarios);

        Registro Registro(Registro obRegistro);
        Usuario Save(Usuario obUsuario);

        string Delete(string IdUsuarios);

        //UpdateImgPerfil UpdateImgPerfil(UpdateImgPerfil obUpdateImgPerfil);
    }
    public class UsuarioService : IUsuarioService
    {
        public static IWebHostEnvironment _webHostEnvironment;
        private ICifrado _ICifradoService;

        public UsuarioService(IWebHostEnvironment webHostEnvironment, ICifrado Cifrado)
        {
            _webHostEnvironment = webHostEnvironment;
            _ICifradoService = Cifrado;
        }

  
        Usuario _obUsuario = new Usuario();
        Registro _obRegistro = new Registro();
        List<Usuario> _obUsuarios = new List<Usuario>();
      

        public object Get(string IdUsuarios)
        {
            _obUsuario = new Usuario();

            try
            {
                _obUsuario = new Usuario(){
                idUsuarios = IdUsuarios
                };

            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var obUsuario = con.Query<Usuario>("dbo.usuario",
              this.SetParameters(_obUsuario, (int)OperationType.Getbyid),
              commandType: CommandType.StoredProcedure);
                
                if (obUsuario != null && obUsuario.Count() > 0)
                {

                        _obUsuario = obUsuario.SingleOrDefault();
                    }
            }

            }
            catch (Exception ex)
            {

                _obUsuario.Message = ex.Message;
            }

            return _obUsuario;
        }

        public List<Usuario> Gets()
        {
            _obUsuarios = new List<Usuario>();

            using (IDbConnection con = new SqlConnection(ConectionString.cnx))
            {

                if (con.State == ConnectionState.Closed) con.Open();
                var obUsuarios = con.Query<Usuario>("dbo.usuario",
                                   this.SetParameters(_obUsuario, (int)OperationType.Get),
                                   commandType: CommandType.StoredProcedure).ToList();

                if (obUsuarios != null && obUsuarios.Count() > 0)
                {
                   _obUsuarios = obUsuarios;
                   _obUsuarios.Select(a =>
                    {
                   
                        a.Password = _ICifradoService.Desencriptar(a.Password);
                     return _obUsuarios;
                    }).ToList();



                }
            }
            return _obUsuarios;

        }

        public Usuario Save(Usuario obUsuario)
        {

            _obUsuario = new Usuario();
            try
            {

                int operationType = Convert.ToInt32(obUsuario.idUsuarios == null ? OperationType.Insert : OperationType.Update);
                using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                {

                    if (con.State == ConnectionState.Closed) con.Open();

                
                    if(obUsuario.idUsuarios != null)
                    {
                        obUsuario.idUsuarios = _ICifradoService.Desencriptar(obUsuario.idUsuarios);
                    }
                  
                        obUsuario.Password = _ICifradoService.Encriptar(obUsuario.Password);
                 
                  
                    var obUser = con.Query<Usuario>("dbo.usuario", this.SetParameters(obUsuario, operationType), commandType: CommandType.StoredProcedure);

                    if (obUser != null && obUser.Count() > 0)
                    {
                        _obUsuario = obUser.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

                _obUsuario.Message = ex.Message;
            }
            return _obUsuario;
        }


        public Registro Registro(Registro obRegistro)
        {

            _obRegistro = new Registro();
            try
            {

                int operationType = Convert.ToInt32(OperationType.Insert);
                using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                {

                    if (con.State == ConnectionState.Closed) con.Open();
                    obRegistro.Foto = Guardarlogo(obRegistro.FotoImg);
                    obRegistro.Id_Tipo_Usuario = "2";

                    var obUser = con.Query<Registro>("dbo.usuario", this.SetParametersRegistro(obRegistro, operationType), commandType: CommandType.StoredProcedure);

                    if (obUser != null && obUser.Count() > 0)
                    {
                        _obRegistro = obUser.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {
                _obRegistro.Message = ex.Message;
            }
            return _obRegistro;
        }

        public string Guardarlogo(IFormFile img)
        {
            string NombreLogo = new String(Path.GetFileNameWithoutExtension(img.FileName).Take(10).ToArray()).Replace(" ", "-");

            NombreLogo = NombreLogo + DateTime.Now.ToString("yymmssff") + Path.GetExtension(img.FileName);
            var ruta = Path.Combine(_webHostEnvironment.ContentRootPath, "Files", NombreLogo);
            using (var stream = new FileStream(ruta, FileMode.Create))
            {
                img.CopyTo(stream);
            }
            return NombreLogo;
        }


        public string Delete(string IdUsuarios)
        {
            string message = "";
            try
            {
                _obUsuario = new Usuario()
                {
                    idUsuarios = IdUsuarios
                };
                using IDbConnection con = new SqlConnection(ConectionString.cnx);
                if (con.State == ConnectionState.Closed) con.Open();
                var obAplicaciones = con.Query<Usuario>("dbo.usuario",

                    this.SetParameters(_obUsuario, (int)OperationType.Delete),
                    commandType: CommandType.StoredProcedure);
                if (obAplicaciones != null && obAplicaciones.Count() > 0)
                {
                    _obUsuario = obAplicaciones.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {

                message = ex.Message;
            }
            return message;
        }



        public async Task<Usuario> Profile(string IdUsuarios)
        {
            using (IDbConnection dbConnection = new SqlConnection(ConectionString.cnx))
            {
                dbConnection.Open();
                var result = await dbConnection.QueryAsync<Usuario>(
                    "dbo.profile",
                    new
                    {
                        idusuarios = IdUsuarios,

                    },
                    commandType: CommandType.StoredProcedure
                );
                return result.FirstOrDefault<Usuario>();
            }
        }


        private DynamicParameters SetParameters(Usuario obUsuario, int operationType)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@@IdUsuarios", obUsuario.idUsuarios);
            parameters.Add("@Nombre", obUsuario.nombre);
            parameters.Add("@Apellido", obUsuario.apellido);
            parameters.Add("@Telefono", obUsuario.telefono);
            parameters.Add("@Correo", obUsuario.correo);
            parameters.Add("@Password", obUsuario.Password);
            parameters.Add("@OperationType", operationType);
            return parameters;
        }

        private DynamicParameters SetParametersRegistro(Registro obRegistro, int operationType)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@@IdUsuarios", obRegistro.IdUsuarios);
            parameters.Add("@Nombre", obRegistro.Nombre);
            parameters.Add("@Apellido", obRegistro.Apellido);
            parameters.Add("@Telefono", obRegistro.Telefono);
            parameters.Add("@Correo", obRegistro.Correo);
            parameters.Add("@Foto", obRegistro.Foto);
            parameters.Add("@Id_Tipo_Usuario", obRegistro.Id_Tipo_Usuario);
            parameters.Add("@Password", obRegistro.Password);
      
            
            parameters.Add("@OperationType", operationType);
            return parameters;
        }



    }
}
