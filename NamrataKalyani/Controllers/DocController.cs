using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using NamrataKalyani.Models;
using System.Web.Security;
using ceTe.DynamicPDF;
using ceTe.DynamicPDF.HtmlConverter;
using ceTe.DynamicPDF.Printing;


namespace NamrataKalyani.Controllers
{
  
    public class DocController : Controller
    {
        // GET: Doc
            public ActionResult Index()
            {
                return View();
            }

        
            public ActionResult DoctorInfo()
            {
                return View();
            }
           
        public ActionResult ClinicalBiochemistoryReportLTF()
            {
                return View();
            }
            public ActionResult ClinicalBiochemistoryReportLIPIDProfile()
            {
                return View();
            }
          
        public ActionResult TestWithPartialView()
        {
            return View();
        }

        public ActionResult Registration()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Registration(RegistrationModel reg)
        {
            var param = new DynamicParameters();
            param.Add("@Name", reg.name);
            param.Add("@Email", reg.emalid);
            param.Add("@Passward", reg.password);
            param.Add("@conformPassward", reg.confirmPassword);
            int i = RetuningData.AddOrSave<int>("Doc_Pati_Registration", param);
            if (i>0)
            {
                return RedirectToAction("Login");
            }
            else
            { 
            return View();
            }
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel login)
        {
            var param = new DynamicParameters();           
            param.Add("@Email", login.email);
            param.Add("@Passward", login.Passward);

            LoginModel i = RetuningData.ReturnigList<LoginModel>("sp_Login", param).SingleOrDefault();
            if (i !=null)
            {
                //FormsAuthentication.SetAuthCookie(param.UserName, false);
                return RedirectToAction("PatientInfo");
            }
            else
            {
                return View();
            }          
        }

        public ActionResult PatientInfo()
        {
            return View();
        }

        [HttpPost]
        public ActionResult PatientInfo(PatientInfoModel pm)
        {
            var param = new DynamicParameters();
            param.Add("@Srno", pm.srno);
            param.Add("@Date", pm.date);
            param.Add("@Pname", pm.pname);
            param.Add("@Age", pm.age);
            param.Add("@RefByDoc", pm.RefByDoc);
            param.Add("@Gender", pm.gender);
            param.Add("@docid", pm.docid);

            int i = RetuningData.ReturnSingleValue<int>("AddNewPatientInfoDetails", param);
            if (i > 0)
            {
                Session["Pid"] = i;
                return RedirectToAction("ComputerBloodPictureReport");
                
            }
            else
            {
                return View();
            }
         
        }

        public ActionResult PatientList()
        {
            List<NamrataKalyani.Models.PatientInfoModel> pat = RetuningData.ReturnigList<PatientInfoModel>("GetPatientInfoDetails", null).ToList();
            return View(pat);
        }

        public ActionResult ComputerBloodPictureReport()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ComputerBloodPictureReport(ComputerBloodPictureReportModel cbrm)
        {
            var param = new DynamicParameters();
            param.Add("@Pid", Session["Pid"]);
            //param.Add("@Date", cbrm.date);
            param.Add("@Haemoglobin", cbrm.haemoglobin);
            param.Add("@ErythrocyteCount", cbrm.erythrocyteCount);
            param.Add("@TotalWBCCount", cbrm.totalWBCCount);
            param.Add("@Neutrophils", cbrm.neutrophils);
            param.Add("@Lymphocytes", cbrm.lymphocytes);
            param.Add("@Eosinophils", cbrm.eosinophils);
            param.Add("@Monocytes", cbrm.monocytes);
            param.Add("@Basophils", cbrm.basophils);
            param.Add("@Rbcs", cbrm.rbcs);
            param.Add("@PlateletCount", cbrm.plateletCount);


            int i = RetuningData.AddOrSave<int>("AddNewComputerBloodPictureReportDetails", param);
            if (i > 0)
            {
                return RedirectToAction("Print_CBPReport");
            }
            else
            {
                return View();
            }
        }
        public ActionResult ComputerBloodPictureReportList()
        {
            var br = RetuningData.ReturnigList<ComputerBloodPictureReportModel>("GetComputerBloodPictureReportDetails", null);
            return View(br);
        }
  

        public ActionResult Print_CBPReport1(int? id)
        {
            ConversionOptions options = new ConversionOptions(ceTe.DynamicPDF.HtmlConverter.PageSize.A4, ceTe.DynamicPDF.HtmlConverter.PageOrientation.Portrait, 0.2f);

            Converter.Convert(new Uri(@"http://localhost:54429/Doc/Print_CBPReport/id="+id), @"E:\WithConversionOptions.pdf", options);
           // Converter.Convert(new Uri("https://en.wikipedia.org"), "E:\\SimpleConversion.pdf");

            //ceTe.DynamicPDF.Printing.PrintJob printJob = new PrintJob("Samsung SCX-3400 Series", "D:\\WithConversionOptions.pdf");
            //printJob.Print();
            //return View();
            return Content("PDFGenrator");
        }
        public ActionResult Print_CBPReport(int? id)
        {
            var param = new DynamicParameters();
            if (Session["Pid"]!=null)
            {
                param.Add("@Pid", Session["Pid"]);
            }
            else
            {
                param.Add("@Pid", id);
            }
           NamrataKalyani.Models.ComputerBloodPictureReportModel pat = RetuningData.ReturnigList<ComputerBloodPictureReportModel>("GetComputerBloodPictureReportDetails", param).SingleOrDefault();
           
            return View("Print_CBPReport", pat);
        }
    }
}