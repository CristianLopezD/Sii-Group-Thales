using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Collections.Generic;

namespace siiGroup_Thales_WebApp.Request
{
    public class HttpHelper
    {
        private readonly string apiBasicUri = "https://localhost:7049/";

        public HttpHelper() { }


        public async Task<List<T>> Get<T>(string url)
        {
            using var client = new HttpClient();
            client.BaseAddress = new Uri(apiBasicUri);
            var result = await client.GetAsync(url);
            result.EnsureSuccessStatusCode();
            string resultContentString = await result.Content.ReadAsStringAsync();
            List<T> resultContent = JsonConvert.DeserializeObject<List<T>>(resultContentString);
            return resultContent;
        }
    }
}