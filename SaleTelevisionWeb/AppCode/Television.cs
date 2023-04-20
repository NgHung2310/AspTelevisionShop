using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SaleTelevisionWeb.AppCode
{
    public class Television
    {
        string id;
        string title;
        string image;
        int size;
        string resolution;
        string brandname;
        string type;
        string price;
        string description;

        public string Id { get => id; set => id = value; }
        public string Title { get => title; set => title = value; }
        public string Image { get => image; set => image = value; }
        public int Size { get => size; set => size = value; }
        public string Resolution { get => resolution; set => resolution = value; }
        public string Brandname { get => brandname; set => brandname = value; }
        public string Type { get => type; set => type = value; }
        public string Price { get => price; set => price = value; }
        public string Description { get => description; set => description = value; }

        public Television()
        {
        }

        public Television(string id, string title, string image, int size, string resolution, string brandname, string type, string price, string description)
        {
            this.id = id;
            this.title = title;
            this.image = image;
            this.size = size;
            this.resolution = resolution;
            this.brandname = brandname;
            this.type = type;
            this.price = price;
            this.description = description;
        }

        public bool InsertDb()
        {
            string sql = "INSERT INTO Television VALUES('@id', N'@title', N'@image', @size, N'@resolution', N'@brandname', N'@type', '@price', N'@description')";
            sql = sql.Replace("@id", this.id);
            sql = sql.Replace("@title", this.title);
            sql = sql.Replace("@image", this.image);
            sql = sql.Replace("@size", this.size.ToString());
            sql = sql.Replace("@resolution", this.resolution);
            sql = sql.Replace("@brandname", this.brandname);
            sql = sql.Replace("@type", this.type);
            sql = sql.Replace("@price", this.price);
            sql = sql.Replace("@description", this.description);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool UpdateDb(Television newTelevision)
        {
            string sql = "UPDATE Television SET Title = N'@title', Image = N'@image', Size = @size, Resolution = N'@resolution', Brandname = N'@brandname', Type = N'@type', Price = '@price', Description = N'@description' WHERE Id = '@id'";
            sql = sql.Replace("@id", this.id);
            sql = sql.Replace("@title", newTelevision.title);
            sql = sql.Replace("@image", newTelevision.image);
            sql = sql.Replace("@size", newTelevision.size.ToString());
            sql = sql.Replace("@resolution", newTelevision.resolution);
            sql = sql.Replace("@brandname", newTelevision.brandname);
            sql = sql.Replace("@type", newTelevision.type);
            sql = sql.Replace("@price", newTelevision.price);
            sql = sql.Replace("@description", newTelevision.description);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool DeleteDb()
        {
            string sql = "DELETE FROM Television WHERE Id = '@id'";
            sql = sql.Replace("@id", this.id);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public static Television GetTelevisionById(string id)
        {
            string sql = "SELECT * FROM Television WHERE Id = '@id'";
            sql = sql.Replace("@id", id);
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            if (dt.Rows.Count > 0)
            {
                string title = dt.Rows[0]["Title"].ToString();
                string image = dt.Rows[0]["Image"].ToString();
                int size = int.Parse(dt.Rows[0]["Size"].ToString());
                string resolution = dt.Rows[0]["Resolution"].ToString();
                string brandname = dt.Rows[0]["Brandname"].ToString();
                string type = dt.Rows[0]["Type"].ToString();
                string price = dt.Rows[0]["Price"].ToString();
                string description = dt.Rows[0]["Description"].ToString();
                return new Television(id, title, image, size, resolution, brandname, type, price, description);
            }
            return null;
        }

        public static List<Television> GetTelevisionByBrand(string brandname)
        {
            string sql = "SELECT * FROM Television WHERE Brandname = '@brandname'";
            sql = sql.Replace("@brandname", brandname);
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            List<Television> list = new List<Television>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string id = dt.Rows[i]["Id"].ToString();
                string title = dt.Rows[i]["Title"].ToString();
                string image = dt.Rows[i]["Image"].ToString();
                int size = int.Parse(dt.Rows[i]["Size"].ToString());
                string resolution = dt.Rows[i]["Resolution"].ToString();
                string type = dt.Rows[i]["Type"].ToString();
                string price = dt.Rows[i]["Price"].ToString();
                string description = dt.Rows[i]["Description"].ToString();
                list.Add(new Television(id, title, image, size, resolution, brandname, type, price, description));
            }
            return list;
        }

        public static List<Television> GetTelevisionByType(string type)
        {
            string sql = "SELECT * FROM Television WHERE Type = '@type'";
            sql = sql.Replace("@type", type);
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            List<Television> list = new List<Television>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string id = dt.Rows[i]["Id"].ToString();
                string title = dt.Rows[i]["Title"].ToString();
                string image = dt.Rows[i]["Image"].ToString();
                int size = int.Parse(dt.Rows[i]["Size"].ToString());
                string resolution = dt.Rows[i]["Resolution"].ToString();
                string brandname = dt.Rows[i]["Brandname"].ToString();
                string price = dt.Rows[i]["Price"].ToString();
                string description = dt.Rows[i]["Description"].ToString();
                list.Add(new Television(id, title, image, size, resolution, brandname, type, price, description));
            }
            return list;
        }
    }
}