using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using EmployeeBusiness;
using EmployeeBusiness.BusinessModels;
using EmployeeWebsite.Models;

namespace EmployeeWebsite.Controllers
{
    public class EmployeesController : ApiController
    {
        public List<EmployeeFullViewModel> GetEmployeeFullDetails()
        {

            List<EmployeeFullViewModel> List = new List<EmployeeFullViewModel>(); 
            IEmployeeBusiness _employee = new EmployeeBusinesses();

            foreach (var item in _employee.GetAll())
            {
                EmployeeFullViewModel emp = new EmployeeFullViewModel()
                {
                    ID=item.ID,
                    FullName=item.FullName,
                    DepartmentId=item.DepartmentId,
                    Salary=item.Salary,
                    PhoneNumber=item.PhoneNumber,
                    Country=item.CountryId
                };
                List.Add(emp);
            }

            return List;
        }

        public List<EmployeeSimpelViewModel> GetEmployeeSimpleDetails()
        {

            List<EmployeeSimpelViewModel> List = new List<EmployeeSimpelViewModel>();
            IEmployeeBusiness _employee = new EmployeeBusinesses();

            foreach (var item in _employee.GetAll())
            {
                EmployeeSimpelViewModel emp = new EmployeeSimpelViewModel()
                {
                    ID = item.ID,
                    FullName = item.FullName
                
                };
                List.Add(emp);
            }

            return List;
        }

        public EmployeeModel GetEmployeeById(int id)
        {
            IEmployeeBusiness _employee = new EmployeeBusinesses();

            return _employee.GetEmployeeById(id);
        }

        public List<EmployeeModel> GetAllEmployee()
        {
            IEmployeeBusiness _employee = new EmployeeBusinesses();

            return _employee.GetAll();

        }

        [HttpDelete]
      public IHttpActionResult DeleteEmployeeById(int id)
        {
            IEmployeeBusiness _employee = new EmployeeBusinesses();

            _employee.DeleteEmployee(id);

            return Ok(new { message = "Employee is deleted successfully." });
        }

        [HttpPost]
        public HttpResponseMessage AddEmployee(EmployeeModel Employee)
        {
            if (ModelState.IsValid)
            {

                IEmployeeBusiness _employee = new EmployeeBusinesses();

                _employee.AddEmployee(Employee);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);

            }

        }

        [HttpPut]
        public IHttpActionResult UpdateEmployee(EmployeeModel Employee, int id)
        {

            IEmployeeBusiness _employee = new EmployeeBusinesses();

            _employee.UpdateEmployee(Employee, id);
            return Ok(new { message = "Employee is updated successfully." });
        }




    }
}
