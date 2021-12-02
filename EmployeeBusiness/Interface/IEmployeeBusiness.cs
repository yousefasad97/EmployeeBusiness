using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayar;
using EmployeeBusiness.BusinessModels;

namespace EmployeeBusiness
{
   public interface IEmployeeBusiness
    {
        
        List<EmployeeModel> GetAll();

        EmployeeModel GetEmployeeById(int id);

        void DeleteEmployee(int id);

        void AddEmployee(EmployeeModel Employee);
        void UpdateEmployee(EmployeeModel Employee, int id);




    }
}
