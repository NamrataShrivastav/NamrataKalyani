using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NamrataKalyani.Models
{
    public class LoginModel
    {
        // public int lid { get; set; }
        //  public string name { get; set; }
        [DisplayName("Email")]
        public string email { get; set; }
        [DisplayName("Password")]
        public string Passward { get; set; }
    }
}