using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NamrataKalyani.Models
{
    public class ReferalDoctorModel
    {
        public int DocId { get; set; }

        public string  DoctorName { get; set; }

        public string Mobile { get; set; }

        public string Email { get; set; }

        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }


        public DateTime UpdatedOn { get; set; }
    }
}