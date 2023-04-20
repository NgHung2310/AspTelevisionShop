using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SaleTelevisionWeb.AppCode
{
    public class UserAccount
    {
        int id;
        string username;
        string password;
        string name;
        string address;
        string phone;
        string role;

        public int Id { get => id; set => id = value; }
        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public string Name { get => name; set => name = value; }
        public string Address { get => address; set => address = value; }
        public string Phone { get => phone; set => phone = value; }
        public string Role { get => role; set => role = value; }
        
        public UserAccount()
        {
        }
        
        public UserAccount(int id, string username, string password, string name, string address, string phone, string role)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.name = name;
            this.address = address;
            this.phone = phone;
            this.role = role;
        }

        public bool InsertDb()
        {
            string sql = "INSERT INTO UserAccount(Username,Password,Name,Address,Phone,Role) VALUES('@username', '@password', N'@name', N'@address', '@phone', '@role')";
            sql = sql.Replace("@username", this.username);
            sql = sql.Replace("@password", this.password);
            sql = sql.Replace("@name", this.name);
            sql = sql.Replace("@address", this.address);
            sql = sql.Replace("@phone", this.phone);
            sql = sql.Replace("@role", this.role);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool UpdateDb(UserAccount newUser)
        {
            string sql = "UPDATE UserAccount SET Username = '@username', Password = '@password', Name = N'@name', Address = N'@address', Phone = '@phone', Role = '@role' WHERE Id = @id";
            sql = sql.Replace("@id", this.id.ToString());
            sql = sql.Replace("@username", newUser.username);
            sql = sql.Replace("@password", newUser.password);
            sql = sql.Replace("@name", newUser.name);
            sql = sql.Replace("@address", newUser.address);
            sql = sql.Replace("@phone", newUser.phone);
            sql = sql.Replace("@role", newUser.role);
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public bool DeleteDb()
        {
            string sql = "DELETE FROM UserAccount WHERE Id = @id";
            sql = sql.Replace("@id", this.id.ToString());
            DbContext db = new DbContext();
            return db.ExecNonQuery(sql);
        }

        public static UserAccount GetUserById(string id)
        {
            string sql = "SELECT * FROM UserAccount WHERE Id = @id";
            sql = sql.Replace("@id", id);
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            if (dt.Rows.Count > 0)
            {
                UserAccount user = new UserAccount(int.Parse(dt.Rows[0]["Id"].ToString()), dt.Rows[0]["Username"].ToString(), dt.Rows[0]["Password"].ToString(), dt.Rows[0]["Name"].ToString(), dt.Rows[0]["Address"].ToString(), dt.Rows[0]["Phone"].ToString(), dt.Rows[0]["Role"].ToString());
                return user;
            }
            return null;
        }

        public static UserAccount GetUserByUsername(string username)
        {
            string sql = "SELECT * FROM UserAccount WHERE Username = '@username'";
            sql = sql.Replace("@username", username);
            DbContext db = new DbContext();
            System.Data.DataTable dt = db.GetDataBySql(sql);
            if (dt.Rows.Count > 0)
            {
                UserAccount user = new UserAccount(int.Parse(dt.Rows[0]["Id"].ToString()), dt.Rows[0]["Username"].ToString(), dt.Rows[0]["Password"].ToString(), dt.Rows[0]["Name"].ToString(), dt.Rows[0]["Address"].ToString(), dt.Rows[0]["Phone"].ToString(), dt.Rows[0]["Role"].ToString());
                return user;
            }
            return null;
        }
    }
}