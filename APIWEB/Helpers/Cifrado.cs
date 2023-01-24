using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIWEB.Helpers
{
    public interface ICifrado
    {

        string Encriptar(string _cadenaAencriptar);
        string Desencriptar(string _cadenaAdeencriptar);



    }
    public class Cifrado : ICifrado
    {
       

        public string Encriptar(String _cadenaAencriptar)
        {
            string result = string.Empty;
            byte[] encryted = System.Text.Encoding.Unicode.GetBytes(_cadenaAencriptar);
            result = Convert.ToBase64String(encryted);
            return result;
        }
        public string Desencriptar(String _cadenaAdeencriptar)
        {
            string result = string.Empty;
            byte[] dencryted = Convert.FromBase64String(_cadenaAdeencriptar);
            result = System.Text.Encoding.Unicode.GetString(dencryted);
            return result;
        }

       
    }
}
