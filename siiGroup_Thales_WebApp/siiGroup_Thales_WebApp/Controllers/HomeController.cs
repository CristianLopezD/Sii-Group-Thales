using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using siiGroup_Thales_WebApp.Request;
using siiGroup_Thales_WebApp.Models;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        private HttpHelper httpHelper = new();
        private string ApiURL = "api/PayrollEmployee/";

        public HomeController() { }

        public IActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public async Task<JsonResult> GetAsync(string id)
        {
            List<v_PayrollEmployee> payrollEmployee = new();
            try
            {
                string filterById = id == null ? string.Empty : $"/{id}";
                payrollEmployee = await httpHelper.Get<v_PayrollEmployee>($"{ApiURL}Get{filterById}");
                return Json(new { result = "Success", data = JsonConvert.SerializeObject(payrollEmployee) });
            }
            catch (Exception ex)
            {
                return Json(new { result = "Error:" + ex.Message, data = JsonConvert.SerializeObject(payrollEmployee) });
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}