using APIWEB.Common;
using APIWEB.Helpers;
using APIWEB.Models;
using Dapper;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net.Mail;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using static APIWEB.Helpers.Cifrado;
//using Dapper;



namespace APIWEB.Services
{
    public interface IAuthService
    {
      

        Task<Usuario> BuscarUsuario(string Correo, string passowrd);
        Task<AuthenticateResponse> Authenticate(string Correo, string Passowrd);

        object RecuperarContrasenaUsuarios(string EmailDestino);
    }


   
    public class AuthService : IAuthService
    {
  
        private readonly AppSettings _appSettings;
        private ICifrado _ICifradoService;
        Usuario _obUsuario = new Usuario();
        List<Usuario> _obUsuarios = new List<Usuario>();

        public object ICifradoService { get; private set; }

        public AuthService(IOptions<AppSettings> appSettings, ICifrado Cifrado)
        {
            _appSettings = appSettings.Value;
            _ICifradoService = Cifrado;


        }
       
        public async Task<Usuario> BuscarUsuario(string usuario, string contrasena)
        {
            
            using (IDbConnection dbConnection = new SqlConnection(ConectionString.cnx))
            {
                dbConnection.Open();
                var result = await dbConnection.QueryAsync<Usuario>(
                    "dbo.login",
                    new
                    {
                        usuario = usuario,
                        contrasena = contrasena
                    },
                    commandType: CommandType.StoredProcedure
                );
                return result.FirstOrDefault<Usuario>();
            }
        }

        public async Task<AuthenticateResponse> Authenticate(string usuario, string password)
        {
            password = _ICifradoService.Encriptar(password);
            var user = await BuscarUsuario(usuario, password);

            if (user == null) return null;
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[] {
                    new Claim(ClaimTypes.Name, user.idUsuarios.ToString())
                }

               
                ),
                Expires = DateTime.UtcNow.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            user.Token = tokenHandler.WriteToken(token);
            return new AuthenticateResponse(user.Token);
        }




        public object RecuperarContrasenaUsuarios(string EmailDestino)
        {
            Random encrip = new Random();
            string contraEncript = _ICifradoService.Encriptar((encrip.Next(100000000, 500000000)).ToString());
            object res;
            try
            {
                string EmailOrigen = "panelcontrol2022@gmail.com";
                string contra = "ivznctmshnhthpoh";
                string Titulo = "Recuperación de contraseña de administrador Panel de Control- ESPAM MFL";
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(EmailOrigen, "PANEL DE CONTROL - ESPAM MFL");
                mail.To.Add(new MailAddress(EmailDestino));
                mail.Subject = Titulo;
                mail.IsBodyHtml = true;
                mail.Body = CuerpoCorreoRC(_ICifradoService.Desencriptar(contraEncript), EmailDestino, "usuario");
                SmtpClient OsmtpClient = new SmtpClient("smtp.gmail.com");
                OsmtpClient.EnableSsl = true;
                OsmtpClient.UseDefaultCredentials = false;
                OsmtpClient.Port = 587;
                OsmtpClient.Credentials = new System.Net.NetworkCredential(EmailOrigen, contra);
                OsmtpClient.Send(mail);
                OsmtpClient.Dispose();

         
            }
            catch (Exception ex)
            {
                return ex;
            }
            try {
                using (IDbConnection con = new SqlConnection(ConectionString.cnx))
                {
                    if (con.State == ConnectionState.Closed) con.Open();
                    res = con.Query<object>("dbo.recuperar_contrasena",
                    this.SetParametersEmail(EmailDestino, contraEncript), commandType: CommandType.StoredProcedure);

                }
            }
            catch (Exception ex)
            {    return ex;

            }
            return res;
        }


        public string CuerpoCorreoRC(string nuevaContrasena, string EmailDestino, string TipoUsuario)
        {
            string date = DateTime.Now.Date.ToShortDateString();
            string body = "<!DOCTYPE html>" +
                             "<html lang = 'es' xmlns = 'https://www.w3.org/1999/xhtml' xmlns: o = 'urn:schemas-microsoft-com:office:office' >" +
                                 "<head>" +
                                     "<meta charset = 'UTF-8' >" +
                                     "<meta name = 'viewport' content = 'width=device-width,initial-scale=1'>" +
                                     "<meta name = 'x-apple-disable-message-reformatting' >" +
                                     "<title></title>" +
                                     "<style>" +
                                     "table, td, div, h1, p { font - family: Arial, sans - serif; }" +
                                     "table, td {" +
                                     "border: 2px solid #000000 !important;}" +
                                     "</style>" +
                                 "</ head >" +
                                 "<body style = 'margin:0;padding:0;' >" +
                                 "<table role = 'presentation' style = 'width:100%;border-collapse:collapse;border:0;border-spacing:0;background:#ffffff;' >" +
                                   "<tr>" +
                                     "<td align = 'center' style = 'padding:0;'>" +
                                         "<table role = 'presentation' style = 'width:602px;border-collapse:collapse;border:1px solid #cccccc;border-spacing:0;text-align:left;' >" +
                                             "<tr>" +
                                                 "<td align = 'center' style = 'padding:40px 0 30px 0;background:#E4E5E6;'>" +
                                                     "<img src = 'https://i.ibb.co/py3JgpV/PANEL-DE-CONTROL-LOGO.png' alt = '' width = '300' style = 'height:auto;display:block;'/>" +
                                                 "</td>" +
                                             "</tr>" +
                                         "<tr>" +
                                             "<td style = 'padding:36px 30px 42px 30px;' >" +
                                                 "<table role = 'presentation' style = 'width:100%;border-collapse:collapse;border:0;border-spacing:0;' >" +
                                                     "<tr>" +
                                                         "<td style = 'padding:0 0 36px 0;color:#153643;'>" +
                                                             "<h1 style = 'font-size:24px;margin:0 0 20px 0;font-family:Arial,sans-serif;'>Recuperación de contraseña del Panel de Control</h1>" +
                                                             "<p style = 'margin:0 0 12px 0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;'>Estimado(a) " + EmailDestino + "</p>" +
                                                             "<p style = 'margin:0 0 12px 0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;'>Su nueva contraseña es : <b>" + nuevaContrasena + "</b></p>" +
                                                             "<p style = 'margin:0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;'>Para actualizar su contraseña ingrese a <a href = 'http://www.example.com' style = 'color:#1CAFEC;text-decoration:underline;' >www.paneldecontrol.com</a></p>" +
                                                             "<p style = 'margin:0 0 12px 0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;'>Fecha: " + date + "</p>" +
                                                            "<br>" +
                                                            "<br>" +
                                                             "<p style = 'margin:0 0 12px 0;font-size:12px;line-height:24px;font-family:Arial,sans-serif;'>Atentamente</p>" +
                                                             "<p style = 'margin:0 0 12px 0;font-size:16px;font-family:Arial,sans-serif;'><b>Panel de Control - ESPAM MFL</b></0>" +
                                                          "</td>" +
                                                     "</tr>" +
                                                  "</table>" +
                                              "</td>" +
                                         "</tr>" +
                                         "<tr>" +
                                             "<td style = 'padding:30px;background:#283842;'>" +
                                                 "<table role = 'presentation' style = 'width:100%;border-collapse:collapse;border:0;border-spacing:0;font-size:9px;font-family:Arial,sans-serif;' >" +
                                                     "<tr>" +
                                                         "<td style = 'padding:0;width:50%;' align = 'left' >" +
                                                             "<p style = 'margin:0;font-size:16px;line-height:16px;font-family:Arial,sans-serif;color:#ffffff;' >" +
                                                             "<br>" +
                                                             "&reg; Panel de Control 2021 <br/>" +
                                                             "</p>" +
                                                         "</td>" +
                                             "<td style = 'padding:0;width:50%;' align = 'left' >" +
                                                 "<table role = 'presentation' style = 'border-collapse:collapse;border:0;border-spacing:0;' >" +
                                                     "<tr>" +
                                                         "<td style = 'padding:0 0 0 10px;width:38px;' >" +
                                                             "<a href = 'http://www.espam.edu.ec/' style = 'color:#ffffff;' ><img src = 'https://i.ibb.co/0n2tXRd/logo.png' alt = 'Twitter' width = '250' style = 'height:auto;display:block;border:0;' /></ a >" +
                                                         "</td >" +
                                                     "</tr>" +
                                                 "</table>" +
                                             "</td>" +
                                         "</tr>" +
                                    "</table>" +
                                   "</td>" +
                                  "</tr>" +
                                "</table>" +
                              "</td>" +
                            "</tr>" +
                          "</table>" +
                        "</body>" +
                      "</html>";
            return body;
        }
        private DynamicParameters SetParametersEmail(string usuario, string contrasena)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@usuario", usuario);
            parameters.Add("@contrasena", contrasena);
            return parameters;
        }

    }
}
