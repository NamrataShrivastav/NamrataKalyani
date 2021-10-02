using Dapper;
using NamrataKalyani.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace NamrataKalyani.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
      
        public ActionResult Login()
        {
            return View("~/Views/Doc/Login.cshtml");
        }

        [HttpPost]
    
        public ActionResult Login(LoginModel login)
        {
            var param = new DynamicParameters();
            param.Add("@Email", login.email);
            param.Add("@Passward", login.Passward);

            LoginModel _login = RetuningData.ReturnigList<LoginModel>("sp_getLogin", param).SingleOrDefault();
            if (_login != null)
            {
                if (_login.Name != null)
                {
                    Session["UserName"] = _login.Name;
                }

                Session["UserId"] = _login.id;

                FormsAuthentication.SetAuthCookie(_login.Name, false);

                return RedirectToAction("Dashboard","Doc");
            }
            else
            {
                return View();
            }
        }
    }
}