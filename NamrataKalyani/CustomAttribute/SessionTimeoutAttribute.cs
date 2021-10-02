using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NamrataKalyani.CustomAttribute
{
 
    public class SessionTimeoutAttribute :  ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContext ctx = HttpContext.Current;
            if (String.IsNullOrEmpty(HttpContext.Current.Session["UserName"].ToString()))
            {
                filterContext.Result = new RedirectResult("~/Doc/Login");
                return;
            }
            base.OnActionExecuting(filterContext);
        }
    }
}