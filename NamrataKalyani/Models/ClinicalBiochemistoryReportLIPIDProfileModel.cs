using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NamrataKalyani.Models
{
    public class ClinicalBiochemistoryReportLIPIDProfileModel
    {
        public int ReportLIPIDPid { get; set; }
        public string serumBilirubin { get; set; }
        public string serumBilirubinD { get; set; }
        public string serumBilirubinID { get; set; }
        public string serumAsparateAminoTransferase { get; set; }
        public string serumTotalProtein { get; set; }
        public string serumAlbumin { get; set; }
        public string serumGlubulin { get; set; }
        public string AGRation { get; set; }
        public string serumAlkalinePhosphatse { get; set; }
    }
}