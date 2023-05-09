using System.ComponentModel.DataAnnotations;

namespace siiGroup_Thales_WebApi.Models
{
    public class Payroll
    {
        [Key]
        public int PayrollID { get; set; }
        public int EmployeeID { get; set; }
        public int PayPeriodID { get; set; }
        public decimal NetPay { get; set; }

    }
}
