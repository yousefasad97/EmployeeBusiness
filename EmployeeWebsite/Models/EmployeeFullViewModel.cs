using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeWebsite.Models
{
    public class EmployeeFullViewModel
    {
        public int ID { get; set; }
        public string FullName { get; set; }
        public int? DepartmentId { get; set; }

        public Decimal? Salary { get; set; }
        public string PhoneNumber { get; set; }
        public int? Country { get; set; }

       

    }
}