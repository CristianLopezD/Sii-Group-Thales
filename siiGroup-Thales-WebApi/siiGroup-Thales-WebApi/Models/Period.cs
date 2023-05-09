using System.ComponentModel.DataAnnotations;

namespace siiGroup_Thales_WebApi.Models
{
    public class Period
    {
        [Key]
        public int PeriodId { get; set; }
        public string PeriodName { get; set; }

    }
}
