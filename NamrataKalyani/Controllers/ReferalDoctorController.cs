﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using PagedList;
using PagedList.Mvc;
using NamrataKalyani.Models;

namespace NamrataKalyani.Controllers
{
    public class ReferalDoctorController : Controller
    {
        // GET: ReferalDoctor
        // GET: ReferDoc
        public ActionResult ReferDocIndex(int? page)
        {
            var rd = RetuningData.ReturnigList<ReferalDoctorModel>("usp_getReferDoc", null).ToPagedList(page ?? 1, 5);

            return View(rd);
        }


        public ActionResult CreateRecord()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateRecord(ReferalDoctorModel rdm)
        {
            var param = new DynamicParameters();
    
            param.Add("@DoctorName", rdm.DoctorName);
            param.Add("@CreatedBy", 1);
            param.Add("@UpdatedBy", 1);

            int i = RetuningData.AddOrSave<int>("uspAddDoctor", param);
            if (i > 0)
            {

                return RedirectToAction("ReferDocIndex");
            }

            return View();
        }
        public ActionResult EditRecord(int? id)
        {
            var param = new DynamicParameters();
            param.Add("@Rid", id);
            var rdm = RetuningData.ReturnigList<ReferalDoctorModel>("sp_ReferDoctorById", param).SingleOrDefault();
            return View(rdm);

        }


        [HttpPost]
        public ActionResult EditRecord(ReferalDoctorModel rdm)
        {
            var param = new DynamicParameters();
            param.Add("@DocId", rdm.DocId);
            param.Add("@DoctorName", rdm.DoctorName);
            //param.Add("@Email", rdm.Email);
            //param.Add("@Mobile", rdm.Mobile);

            //param.Add("@UpdatedBy", 1);
            param.Add("@UpdatedOn", DateTime.Now);

            int i = RetuningData.AddOrSave<int>("sp_UpdateReferDoctorById", param);

            if (i > 0)
            {
                return RedirectToAction("ReferDocIndex");
            }
            return View();
        }


        public ActionResult DeleteRecord(int? id)
        {

            var param = new DynamicParameters();
            param.Add("@Rid", id);
            var rm = RetuningData.ReturnigList<ReferalDoctorModel>("sp_ReferDoctorById", param).SingleOrDefault();
            return View(rm);
        }

        [HttpPost]
        public ActionResult DeleteRecord(ReferalDoctorModel rdm)
        {

            var param = new DynamicParameters();

            param.Add("@Rid", rdm.DocId);
            var num = RetuningData.ReturnigList<ReferalDoctorModel>("DeleteReferalDocById", param).SingleOrDefault();


            if (num != null)
            {
                ViewBag.msg = "Record Deleted";
                return RedirectToAction("ReferDocIndex");
            }

            return RedirectToAction("ReferDocIndex");
        }
    }
}