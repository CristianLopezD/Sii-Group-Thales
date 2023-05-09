using siiGroup_Thales_WebApi.Models;
using Microsoft.EntityFrameworkCore;

namespace siiGroup_Thales_WebApi.Data
{
    public class dbContext : DbContext
    {
        public dbContext(DbContextOptions options) : base(options) { }

        public DbSet<Employees> Employees { get; set; }

        public DbSet<Payroll> Payroll { get; set; }

        public DbSet<Period> Period { get; set; }
        public DbSet<v_PayrollEmployee> v_PayrollEmployee { get; set; }
    }
}
