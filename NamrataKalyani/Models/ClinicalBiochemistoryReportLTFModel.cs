using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NamrataKalyani.Models
{
    public class ClinicalBiochemistoryReportLTFModel
    {
       public int ReportLTFid { get; set; }
       public string serumCholestrol { get; set; }
        public string hdlCholestrol { get; set; }
        public string LDLCholestrol { get; set; }
        public string VLDLCholestrol { get; set; }
        public string serumTriglyceride { get; set; }
        public string THDL { get; set; }
        public string LDLHDL { get; set; }
        public string titalLipid { get; set; }
    }
}