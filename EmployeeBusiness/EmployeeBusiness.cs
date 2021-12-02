using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayar;
using EmployeeBusiness.BusinessModels;

namespace EmployeeBusiness
{
    public class EmployeeBusinesses : IEmployeeBusiness

    {


        EmployeesEntities Con = new EmployeesEntities();

        public List<EmployeeModel> GetAll()
        {
            var EmployeeList = Con.T_Employee.ToList();
          

            List<EmployeeModel> listEmployeeModel = new List<EmployeeModel>();

            foreach (var item in EmployeeList)
            {
                EmployeeModel obj = new EmployeeModel();

                obj.ID = item.ID;
                obj.FullName = item.FullName;
                obj.Salary = item.Salary;
                obj.PhoneNumber = item.PhoneNumber;
                obj.Department = item.T_Department.DepartmentName;
                obj.Country = item.T_Country.CountryName;
                obj.CountryId = item.CountryID;
                obj.DepartmentId = item.DepartmentID;
                listEmployeeModel.Add(obj);
            }

           


            return listEmployeeModel;
        }
        public EmployeeModel GetEmployeeById(int id)
        {
            EmployeeModel Emp = new EmployeeModel();
            var EmployeeList = Con.T_Employee.Where(x=>x.ID==id).FirstOrDefault();
            Emp.ID = EmployeeList.ID;
            Emp.Country = EmployeeList.T_Country.CountryName;
            Emp.Department = EmployeeList.T_Department.DepartmentName;
            Emp.FullName = EmployeeList.FullName;
            Emp.PhoneNumber = EmployeeList.PhoneNumber;
            Emp.Salary = EmployeeList.Salary;


            return Emp;

        }
        public void DeleteEmployee(int id)
        {
            try
            {
                //EmployeeModel emp = new EmployeeModel();
                var EmployeeList = Con.T_Employee.Find(id);


                if (EmployeeList != null)
                {
                    Con.T_Employee.Remove(EmployeeList);
                    Con.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void AddEmployee(EmployeeModel item)
        {
            var EmployeeList = Con.T_Employee.ToList();
            T_Employee obj = new T_Employee();
               
            obj.FullName = item.FullName;
            obj.CountryID = item.CountryId;
            obj.PhoneNumber = item.PhoneNumber;
            obj.Salary = item.Salary;
            obj.DepartmentID = item.DepartmentId;

            Con.T_Employee.Add(obj);
            Con.SaveChanges();
        }
        public void UpdateEmployee(EmployeeModel item, int id)
        {
            var GetEmployeeById = Con.T_Employee.Where(x => x.ID == id).FirstOrDefault();
            try
            {
                if (GetEmployeeById != null)
                {

                    GetEmployeeById.FullName = item.FullName;
                    GetEmployeeById.CountryID = item.CountryId;
                    GetEmployeeById.DepartmentID = item.DepartmentId;
                    GetEmployeeById.Salary = item.Salary;
                    GetEmployeeById.PhoneNumber = item.PhoneNumber;


                    Con.SaveChanges();
                }
            }
            catch (Exception ex) { throw ex; }
        }
    }
}
