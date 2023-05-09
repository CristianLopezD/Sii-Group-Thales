using siiGroup_Thales_WebApp.Request;
using siiGroup_Thales_WebApp.Models;

namespace siiGroup_Thales_Test
{
    public class Tests
    {
        List<v_PayrollEmployee> payrollEmployee = new();

        [SetUp]
        public async Task Setup()
        {
            // Arrange
            HttpHelper httpHelper = new();
            string ApiURL = "api/PayrollEmployee/";

            var employeeId = "1";
            string filterById = $"/{employeeId}";
            payrollEmployee = await httpHelper.Get<v_PayrollEmployee>($"{ApiURL}Get{filterById}");
        }

        [TestCase]
        public void TestCalculateSalary()
        {
            // Assert
            Assert.IsTrue(payrollEmployee.Count() == 1);
            Assert.That(actual: payrollEmployee?.FirstOrDefault().AnualSalary, Is.EqualTo(payrollEmployee?.FirstOrDefault().NetPay * 12));
        }
    }
}