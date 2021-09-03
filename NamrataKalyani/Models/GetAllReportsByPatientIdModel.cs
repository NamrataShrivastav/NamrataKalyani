using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NamrataKalyani.Models
{
    public class GetAllReportsByPatientIdModel
    {       
        public int Pid { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
    }
}