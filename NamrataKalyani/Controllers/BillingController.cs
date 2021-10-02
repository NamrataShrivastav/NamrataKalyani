using Dapper;
using NamrataKalyani.CustomAttribute;
using NamrataKalyani.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace NamrataKalyani.Controllers
{
    [Authorize]
    [SessionTimeoutAttribute]
    public class BillingController : Controller
    {
        // GET: Billing
        public ActionResult GetBillingInfo(int? BillId, string BeginDate, string Enddate)
        {
            var dlist = RetuningData.ReturnigList<PatientInfoModel>("usp_getReportsByBill", null);
            ViewBag.PatientList = new SelectList(dlist, "PId", "PName");
            var param = new DynamicParameters();
            param.Add("@BillId", BillId);
            param.Add("@BeginDate", BeginDate);
            param.Add("@EndDate", Enddate);
            var Bill = RetuningData.ReturnigList<_BilIingInfoModel>("getReports_test", param);
             
            return View(Bill);
        }

        public ActionResult UpdateBillingInfo(int? id, string BeginDate, string Enddate)
        {
            var param = new DynamicParameters();
            param.Add("@BillId", id);
            param.Add("@BeginDate", BeginDate);
            param.Add("@EndDate", Enddate);
            var Bill = RetuningData.ReturnigList<_BilIingInfoModel>("getReports_test", param).SingleOrDefault();

            return View(Bill);
        }
        
        [HttpPost]
        public ActionResult UpdateBillingInfo(_BilIingInfoModel Bill)
        {
            int result=0;

                var param = new DynamicParameters();
                param.Add("@BillId", Bill.BillId);
                param.Add("@Amount", Bill.Amount);
                param.Add("@Discount", Bill.Discount);
                param.Add("@Expenses", Bill.Expenses);
                param.Add("@Due", Bill.Due);
                param.Add("@ReferalAmount", Bill.ReferalAmount);
                param.Add("@Status", Bill.Status);
                param.Add("@ReferalPercentage", Bill.ReferalPercentage);
                param.Add("@UpdatedBy", 1);
                result= RetuningData.AddOrSave<int>("usp_UpdateBilling", param);
          
                if (result > 0)  
                {
                    return RedirectToAction("GetBillingInfo");
                }
                else
                {
                    return View(Bill);
                }
            }
        }
    }
