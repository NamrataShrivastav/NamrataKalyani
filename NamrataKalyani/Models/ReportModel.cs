using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NamrataKalyani.Models
{
    public class ReportModel
    {
        public int Id { get; set; }
        public string ReportType { get; set; }
        public int ReportTypeId { get; set; }
        public string ReportId { get; set; }
        [AllowHtml]
        public string Description { get; set; }
        
        public int CreatedBy { get; set; }
        public int UpdatedBy { get; set; }
    }
}