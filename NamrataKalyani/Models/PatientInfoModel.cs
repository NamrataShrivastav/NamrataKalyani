using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace NamrataKalyani.Models
{
    public class PatientInfoModel
    {
        
        public int pid { get; set; }
        [DisplayName("Doctor ID")]
        public int docid { get; set; }
        [DisplayName("Sr No.")]
        public int srno { get; set; }
        [DisplayName("Date")]
        public DateTime date { get; set; }
        [DisplayName("Patient Name")]
        public string pname { get; set; }
        [DisplayName("Age")]
        public int age { get; set; }
        [DisplayName("Ref. By Doctor")]
        public string RefByDoc { get; set; }
        [DisplayName("Gender")]
        public Nullable<bool> gender { get; set; }
        //public string emailid { get; set; }
        //public string password { get; set; }
    }
}