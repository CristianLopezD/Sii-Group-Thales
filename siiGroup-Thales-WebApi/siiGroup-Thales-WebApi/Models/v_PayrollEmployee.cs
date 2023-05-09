using System.ComponentModel.DataAnnotations;

namespace siiGroup_Thales_WebApi.Models
{
    public class v_PayrollEmployee
    {
        [Key]
        public int PayrollID { get; set; }
        public int EmployeeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public DateTime HireDate { get; set; }
        public int PayPeriodID { get; set; }
        public string PeriodName { get; set; }
        public decimal NetPay { get; set; }
        public decimal AnualSalary { get; set; }
    }
}
