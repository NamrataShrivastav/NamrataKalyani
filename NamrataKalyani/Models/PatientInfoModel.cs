using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;

namespace NamrataKalyani.Models
{
    public class PatientInfoModel
    {
        public enum Gender
        {
            Male,
            Female
        }
        public int? pid { get; set; }
       
        public int? docid { get; set; }
       
        public SelectList DoctorList { get; set; }

        [DisplayName("Doctor Name")]
        public string Doc_Name { get; set; }
        public string SelectedDoctor { get; set; }


        [DisplayName("Sr No.")]
        public int? srno { get; set; }
        [DisplayName("Date")]
        public DateTime? date { get; set; }
        [DisplayName("Patient Name")]
        public string pname { get; set; }
        [DisplayName("Age")]
        public int? age { get; set; }
        [DisplayName("Ref. By Doctor")]
        public string RefByDoc { get; set; }
        [DisplayName("Gender")]
        public string gender { get; set; }
        public string mobileNo { get; set; }
        public string Name_Mobile { get; set; }
    }

   
}
