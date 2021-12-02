using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeBusiness.BusinessModels
{
    public class EmployeeModel
    {
       
        public int ID { get; set; }
        
        
       
        [Required(ErrorMessage = "Please enter Full name ")]
        public string FullName { get; set; }

     
        public string Department { get; set; }
        [Required]
        [Range(0, 9999999999999999.99, ErrorMessage = "Invalid Salary ; Max 18 digits")]

        public Decimal? Salary { get; set; }

        [Required(ErrorMessage = "Mobile Number is required.")]
        public string PhoneNumber { get; set; }
        public string Country { get; set; }

        [Required(ErrorMessage = "DepartmentId must be integer.")]
        public int? DepartmentId { get; set; }
        [Required(ErrorMessage = "CountryId must ne integer.")]
        public int? CountryId { get; set; }
    }
}
