using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SaleTelevisionWeb.AppCode
{
    public class DbContext
    {
        string dbConStr;
        SqlConnection conn;

        public DbContext()
        {
            //dbConStr = @"Data Source=(localdb)\MSSqlLocalDb;Initial Catalog=SaleTelevisionWeb;Integrated Security=True";
            dbConStr = ConfigurationManager.ConnectionStrings["SaleTelevisionWebDb"].ToString();
            conn = new SqlConnection(dbConStr);
        }

        public System.Data.DataTable GetDataBySql(string sql)
        {
            System.Data.DataTable dt = new System.Data.DataTable();
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                    conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();
            }
            return dt;
        }

        public bool ExecNonQuery(string sql)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                conn.Close();
                throw ex;
                return false;
            }
            finally
            {
                conn.Close();
            }
            return true;
        }
    }
}