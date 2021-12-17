using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSON_Responce_from_Webmethod_To_Jquery_AJAX
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // JsonResponce();
        }
        [WebMethod]
        public static ProductRoot getProductDetails()
        {
            string jsonString = File.ReadAllText(HostingEnvironment.MapPath("~/jsonFile.json"));
            var content = jsonString;
            var jsonResult = JsonConvert.DeserializeObject(content).ToString();
            var result = JsonConvert.DeserializeObject<ProductRoot>(jsonResult);
            return result;

        }
    }
    public class ProductDetails
    {
        public int amount;
        public int manufacturing_year;
        public string manufacturing_month;
        public string color;
    }

    public class ProductRoot
    {
        public string status;
        public int  status_code;
        public string product_name;
        public ProductDetails product_details;
    }


}