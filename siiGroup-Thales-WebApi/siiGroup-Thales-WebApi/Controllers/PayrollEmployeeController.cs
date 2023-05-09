using siiGroup_Thales_WebApi.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using siiGroup_Thales_WebApi.Models;

namespace siiGroup_Thales_WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PayrollEmployeeController : Controller
    {
        private readonly dbContext dbContext;

        public PayrollEmployeeController(dbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        [HttpGet]
        [Route("Get")]
        public async Task<IActionResult> GetPayrollEmployee()
        {
            //return Ok(await dbContext.v_PayrollEmployee.ToListAsync());
            return Ok(await dbContext.v_PayrollEmployee.ToListAsync());

        }

        [HttpGet]
        [Route("Get/{id:int}")]
        public async Task<IActionResult> GetPayrollEmployeeById([FromRoute] int id)
        {
            v_PayrollEmployee? payrollEmployee = await dbContext.v_PayrollEmployee.FindAsync(id);
            if (payrollEmployee == null) return NotFound();
            return Ok(new List<v_PayrollEmployee> { payrollEmployee });
        }
    }
}
