using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SaleTelevisionWeb.AppCode
{
    public class CustomerCart
    {
        int id;
        int customerId;
        string televisionId;
        int quantity;
        DateTime time;
        string total;
        string state;

        public int Id { get => id; set => id = value; }
        public int CustomerId { get => customerId; set => customerId = value; }
        public string TelevisionId { get => televisionId; set => televisionId = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public DateTime Time { get => time; set => time = value; }
        public string Total { get => total; set => total = value; }
        public string State { get => state; set => state = value; }

        public CustomerCart()
        {
        }

        public CustomerCart(int id, int customerId, string televisionId, int quantity, DateTime time, string total, string state)
        {
            this.id = id;
            this.customerId = customerId;
            this.televisionId = televisionId;
            this.quantity = quantity;
            this.time = time;
            this.total = total;
            this.state = state;
        }

        public bool InsertDb()
        {
            string sql = "INSERT INTO CustomerCart(CustomerId, TelevisionId, Quantity, Time, Total, State) VALUES(@customerId, '@televisionId', @quantity, '@time', '@total', '@state')";
            sql = sql.Replace("@customerId", this.customerId.ToString());
            sql = sql.Replace("@televisionId", this.televisionId);
            sql = sql.Replace("@quantity", this.quantity.ToString());
            sql = sql.Replace("@time", this.time.ToString());
            sql = sql.Replace("@total", this.total);
            sql = sql.Replace("@state", this.state);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool UpdateDb()
        {
            string sql = "UPDATE CustomerCart SET customerId = @customerId, televisionId = '@televisionId', quantity = @quantity, time = '@time', total = '@total', state = '@state' WHERE id = @id";
            sql = sql.Replace("@id", this.id.ToString());
            sql = sql.Replace("@customerId", this.customerId.ToString());
            sql = sql.Replace("@televisionId", this.televisionId);
            sql = sql.Replace("@quantity", this.quantity.ToString());
            sql = sql.Replace("@time", this.time.ToString());
            sql = sql.Replace("@total", this.total);
            sql = sql.Replace("@state", this.state);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool DeleteDb()
        {
            string sql = "DELETE FROM CustomerCart WHERE id = @id";
            sql = sql.Replace("@id", this.id.ToString());
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public static CustomerCart GetCustomerCartById(int id)
        {
            string sql = "SELECT * FROM CustomerCart WHERE id = @id";
            sql = sql.Replace("@id", id.ToString());
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            if (dt.Rows.Count > 0)
            {
                CustomerCart customerCart = new CustomerCart();
                customerCart.id = int.Parse(dt.Rows[0]["Id"].ToString());
                customerCart.customerId = int.Parse(dt.Rows[0]["CustomerId"].ToString());
                customerCart.televisionId = dt.Rows[0]["TelevisionId"].ToString();
                customerCart.quantity = int.Parse(dt.Rows[0]["Quantity"].ToString());
                customerCart.time = DateTime.Parse(dt.Rows[0]["Time"].ToString());
                customerCart.total = dt.Rows[0]["Total"].ToString();
                customerCart.state = dt.Rows[0]["State"].ToString();
                return customerCart;
            }
            return null;
        }

        public static List<CustomerCart> GetCustomerCartByCustomerId(int customerId)
        {
            string sql = "SELECT * FROM CustomerCart WHERE customerId = @customerId";
            sql = sql.Replace("@customerId", customerId.ToString());
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            List<CustomerCart> list = new List<CustomerCart>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CustomerCart customerCart = new CustomerCart();
                customerCart.id = int.Parse(dt.Rows[0]["Id"].ToString());
                customerCart.customerId = int.Parse(dt.Rows[0]["CustomerId"].ToString());
                customerCart.televisionId = dt.Rows[0]["TelevisionId"].ToString();
                customerCart.quantity = int.Parse(dt.Rows[0]["Quantity"].ToString());
                customerCart.time = DateTime.Parse(dt.Rows[0]["Time"].ToString());
                customerCart.total = dt.Rows[0]["Total"].ToString();
                customerCart.state = dt.Rows[0]["State"].ToString();
                list.Add(customerCart);
            }
            return list;
        }

        public static List<CustomerCart> GetTelevisionCartByTelevisionId(string televisionId)
        {
            string sql = "SELECT * FROM CustomerCart WHERE televisionId = @televisionId";
            sql = sql.Replace("@televisionId", televisionId.ToString());
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            List<CustomerCart> list = new List<CustomerCart>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                CustomerCart customerCart = new CustomerCart();
                customerCart.id = int.Parse(dt.Rows[0]["Id"].ToString());
                customerCart.customerId = int.Parse(dt.Rows[0]["CustomerId"].ToString());
                customerCart.televisionId = dt.Rows[0]["TelevisionId"].ToString();
                customerCart.quantity = int.Parse(dt.Rows[0]["Quantity"].ToString());
                customerCart.time = DateTime.Parse(dt.Rows[0]["Time"].ToString());
                customerCart.total = dt.Rows[0]["Total"].ToString();
                customerCart.state = dt.Rows[0]["State"].ToString();
                list.Add(customerCart);
            }
            return list;
        }
    }
}
