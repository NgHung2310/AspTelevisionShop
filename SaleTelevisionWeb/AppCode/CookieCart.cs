using SaleTelevisionWeb.Customer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SaleTelevisionWeb.AppCode
{
    public class CookieCart
    {
        public static DataTable CookieValueToDataTable(string cookieValue)
        {
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("TelevisionId");
            dt.Columns.Add("Quantity");
            if (string.IsNullOrEmpty(cookieValue))
                return dt;
            string[] arr = cookieValue.Split(';');
            foreach (string item in arr)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    string[] arr2 = item.Split(',');
                    dt.Rows.Add(arr2);
                }
            }    
            return dt;
        }

        public static string DataTableToCookieValue(DataTable dt)
        {
            string result = "";
            foreach(DataRow dr in dt.Rows)
            {
                result += $"{dr["TelevisionId"]},{dr["Quantity"]};";
            }
            return result;
        }   
        
        public static void AddTelevisionToCart(Television television)
        {
            if (string.IsNullOrEmpty( HttpContext.Current.Response.Cookies["Cart"].Value))
                HttpContext.Current.Response.Cookies["Cart"].Expires = DateTime.Now.AddDays(1);
            DataTable dt = CookieCart.CookieValueToDataTable(HttpContext.Current.Response.Cookies["Cart"].Value);
            foreach (DataRow dtr in dt.Rows)
            {
                if (dtr["TelevisionId"].ToString() == television.Id)
                {
                    dtr["Quantity"] = int.Parse(dtr["Quantity"].ToString()) + 1;
                    HttpContext.Current.Response.Cookies["Cart"].Value = CookieCart.DataTableToCookieValue(dt);
                    return;
                }
            }
            DataRow dr = dt.NewRow();
            dr["TelevisionId"] = television.Id;
            dr["Quantity"] = 1;
            dt.Rows.Add(dr);
            HttpContext.Current.Response.Cookies["Cart"].Value = CookieCart.DataTableToCookieValue(dt);            
        }

        public static int GetTelevisionQuantity()
        {
            DataTable dt = CookieCart.CookieValueToDataTable(HttpContext.Current.Response.Cookies["Cart"].Value);
            int quantity = 0;
            foreach (DataRow dtr in dt.Rows)
            {
                quantity += int.Parse(dtr["Quantity"].ToString());
            }
            return quantity;
        } 
    }
    
}
