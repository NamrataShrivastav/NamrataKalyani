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
                return RedirectToAction("Dashboard");
                
            }
            else
            {
                return View();
            }          
        }

        public ActionResult PatientInfo()
        {
            PatientInfoModel Doc = new PatientInfoModel();

            var dlist = RetuningData.ReturnigList<PatientInfoModel>("uspGetDoctotList", null);
            Doc.DoctorList = new SelectList(dlist, "docid", "Doc_Name");
            return View(Doc);
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
            param.Add("@docid",pm.docid);
            param.Add("@mobileNo", pm.mobileNo);

            string mobileno = RetuningData.ReturnSingleValue<string>("AddNewPatientInfoDetails", param);
            if (mobileno !=null && mobileno!="")
            {
                Session["mobileno"] = mobileno;
                return RedirectToAction("Dashboard");
                //return RedirectToAction("PatientReport");
            }
            else
            {
                return View();
            }
         
        }
        public ActionResult PatientReport()
        {
            var param = new DynamicParameters();
             param.Add("@Name_Mobile", Session["mobileno"]);
            
            var rltf = RetuningData.ReturnigList<ClinicalBiochemistoryReportLTFModel>("uspGetDashborad", param);
            return View(rltf);
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
            try
            {
                ConversionOptions options = new ConversionOptions(ceTe.DynamicPDF.HtmlConverter.PageSize.A4, ceTe.DynamicPDF.HtmlConverter.PageOrientation.Portrait, 0.2f);
                // Session["Pid"] = id;
                Converter.Convert(new Uri(@"http://localhost:54429/Doc/Print_CBPReport"), @"E:\WithConversionOptions.pdf", options);
                // Converter.Convert(new Uri("https://en.wikipedia.org"), "E:\\SimpleConversion.pdf");

                //ceTe.DynamicPDF.Printing.PrintJob printJob = new PrintJob("Samsung SCX-3400 Series", "D:\\WithConversionOptions.pdf");
                //printJob.Print();
                //return View();
            }
            catch (Exception ex)
            {

                throw;
            }
            
            return Content("PDFGenrator");
        }
        public ActionResult Print_CBPReport()
        {
            var param = new DynamicParameters();
            if (Session["Pid"]!=null)
            {
                param.Add("@Pid", 10);
            }
            else
            {
                param.Add("@Pid", 10);
            }
           NamrataKalyani.Models.ComputerBloodPictureReportModel pat = RetuningData.ReturnigList<ComputerBloodPictureReportModel>("GetComputerBloodPictureReportDetails", param).SingleOrDefault();
           
            return View("Print_CBPReport", pat);
        }
        public ActionResult ClinicalBiochemistoryReportLIPIDProfile()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ClinicalBiochemistoryReportLIPIDProfile(ClinicalBiochemistoryReportLIPIDProfileModel lipid)
        {
            var param = new DynamicParameters();
            //param.Add("@Pid", Session["Pid"]);
            //param.Add("@Date", cbrm.date);
            param.Add("@ReportLIPIDPid", lipid.ReportLIPIDPid);
            param.Add("@Pid", lipid.pid);
            param.Add("@serumCholestrol", lipid.serumCholestrol);
            param.Add("@hdlCholestrol", lipid.hdlCholestrol);
            param.Add("@LDLCholestrol", lipid.LDLCholestrol);
            param.Add("@VLDLCholestrol", lipid.VLDLCholestrol);
            param.Add("@serumTriglyceride", lipid.serumTriglyceride);
            param.Add("@THDL", lipid.THDL);
            param.Add("@LDLHDL", lipid.LDLHDL);
            param.Add("@titalLipid", lipid.titalLipid);


            int i = RetuningData.AddOrSave<int>("AddNewClinicalBiochemistoryReportLIPIDProfileDetails", param);
            if (i > 0)
            {
                return RedirectToAction("Print_LIPIDProfileReport");
                //return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public ActionResult ClinicalBiochemistoryReportLIPIDProfileList()
        {
            var rlipid = RetuningData.ReturnigList<ClinicalBiochemistoryReportLTFModel>("GetClinicalBiochemistoryReportLIPIDProfileDetails", null);
            return View(rlipid);    
        }
        public ActionResult Print_LIPIDProfileReport()
        {
            var param = new DynamicParameters();
            if (Session["Pid"] != null)
            {
                param.Add("@Pid", 10);
            }
            else
            {
                param.Add("@Pid", 10);
            }
            NamrataKalyani.Models.ClinicalBiochemistoryReportLIPIDProfileModel pat = RetuningData.ReturnigList<ClinicalBiochemistoryReportLIPIDProfileModel>("GetClinicalBiochemistoryReportLIPIDProfileDetails", param).SingleOrDefault();

            return View("", pat);
        }
        public ActionResult ClinicalBiochemistoryReportLTF()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ClinicalBiochemistoryReportLTF(ClinicalBiochemistoryReportLTFModel ltf)
        {
            var param = new DynamicParameters();
            // param.Add("@Pid", Session["Pid"]);
            // param.Add("@Date", ltf.date);
            param.Add("@ReportLTFid", ltf.ReportLTFid);
            param.Add("@Pid", ltf.pid);
            param.Add("@serumBilirubin", ltf.serumBilirubin);
            param.Add("@serumBilirubinD", ltf.serumBilirubinD);
            param.Add("@serumBilirubinID", ltf.serumBilirubinID);
            param.Add("@serumAsparateAminoTransferase", ltf.serumAsparateAminoTransferase);
            param.Add("@serumAlanineAminoTransferase", ltf.serumAlanineAminoTransferase);
            param.Add("@serumTotalProtein", ltf.serumTotalProtein);
            param.Add("@serumAlbumin", ltf.serumAlbumin);
            param.Add("@serumGlubulin", ltf.serumGlubulin);
            param.Add("@AGRation", ltf.AGRation);
            param.Add("@serumAlkalinePhosphatse", ltf.serumAlkalinePhosphatse);
            int i = RetuningData.AddOrSave<int>("AddNewClinicalBiochemistoryReportLTFDetails", param);
            if (i > 0)
            {
                return RedirectToAction("Print_LTFReport");
                //return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public ActionResult ClinicalBiochemistoryReportLTFList()
        {
            var rltf = RetuningData.ReturnigList<ClinicalBiochemistoryReportLTFModel>("GetClinicalBiochemistoryReportLTFDetail", null);
            return View(rltf);         
        }
        public ActionResult Print_LTFReport()
        {
            var param = new DynamicParameters();
            if (Session["Pid"] != null)
            {
                param.Add("@Pid", 10);
            }
            else
            {
                param.Add("@Pid", 10);
            }
            NamrataKalyani.Models.ClinicalBiochemistoryReportLTFModel pat = RetuningData.ReturnigList<ClinicalBiochemistoryReportLTFModel>("GetClinicalBiochemistoryReportLTFDetail", param).SingleOrDefault();

            return View("", pat);
        }

        public ActionResult Dashboard()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dashboard(PatientInfoModel dm)
        {
            var param = new DynamicParameters();
            // param.Add("@Pid", Session["Pid"]);
            //param.Add("@Date", cbrm.date);
            param.Add("@Name_Mobile", dm.Name_Mobile);
            //int i = RetuningData.AddOrSave<int>("Dashborad", param);
            var i = RetuningData.ReturnigList<PatientInfoModel>("uspGetDashborad", param);
            if (i != null)
            {
                //param.Add("@Name_Mobile", i.Pname);
                //FormsAuthentication.SetAuthCookie(param.UserName, false);
                return View(i);
            }
            else
            {
                return View();
            }

        }
        //[HttpGet]
        //public ActionResult PatientReport()
        //{
        //    return View();
        //}
      
        
        [HttpPost]
        public ActionResult Index(PatientInfoModel dm)
        {
            var param = new DynamicParameters();
            // param.Add("@Pid", Session["Pid"]);
            //param.Add("@Date", cbrm.date);
            param.Add("@Pid", dm.pid);
            param.Add("@Date", dm.date);
            param.Add("@Pname", dm.pname); 
            param.Add("@RefByDoc", dm.RefByDoc);   
          
            //int i = RetuningData.AddOrSave<int>("Dashborad", param);
            PatientInfoModel i = RetuningData.ReturnigList<PatientInfoModel>("AddReportType_Details", param).SingleOrDefault();
            if (i != null)
            {
                //FormsAuthentication.SetAuthCookie(param.UserName, false);
                return RedirectToAction("PatientReport");
            }
            else
            {
                return View();
            }

        }
        public ActionResult GetAllReportsByPatientId(int? id)
        {
            var param = new DynamicParameters();
                      
            param.Add("@Pid", id);

            var rltf = RetuningData.ReturnigList<GetAllReportsByPatientIdModel>("usp_getAllReportsByPatientId", param);
            return View(rltf);          
        }
       
    }
}