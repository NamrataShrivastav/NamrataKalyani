using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NamrataKalyani.Models
{
    public class ReportByPidModel
    {
        public int Pid { get; set; }
        public int ReportTypeId { get; set; }
        public int ReportId { get; set; }
    }
}