using System.ComponentModel.DataAnnotations;

namespace siiGroup_Thales_WebApp.Models
{
    public class Employees
    {
        [Key]
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public decimal Salary { get; set; }
        public decimal AnualSalary { get; set; }
        public DateTime HireDate { get; set; }

    }
}
