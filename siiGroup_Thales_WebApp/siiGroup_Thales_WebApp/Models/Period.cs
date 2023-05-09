using System.ComponentModel.DataAnnotations;

namespace siiGroup_Thales_WebApp.Models
{
    public class Period
    {
        [Key]
        public int PeriodId { get; set; }
        public string PeriodName { get; set; }

    }
}
