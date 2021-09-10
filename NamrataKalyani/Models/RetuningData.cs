﻿using System;
using Dapper;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

namespace NamrataKalyani.Models
{
    public static class RetuningData
    {
     
        public static T AddOrSave<T>(String spName, DynamicParameters param)
        {
            SqlConnection con = new SqlConnection("Data Source=A2NWPLSK14SQL-v02.shr.prod.iad2.secureserver.net; User Id=akbardiagnostic;Password=Password@1; Initial Catalog=akbardiagnostic");
            var result = (T)Convert.ChangeType(con.Execute(spName, param, commandType: CommandType.StoredProcedure),typeof(T));
            return result;
        }
        public static T ReturnSingleValue<T>(String spName, DynamicParameters param)
        {
            SqlConnection con = new SqlConnection("Data Source=A2NWPLSK14SQL-v02.shr.prod.iad2.secureserver.net; User Id=akbardiagnostic;Password=Password@1; Initial Catalog=akbardiagnostic");
            var result = (T)Convert.ChangeType(con.ExecuteScalar(spName, param, commandType: CommandType.StoredProcedure), typeof(T));
            return result;
        }
        public static IEnumerable<T> ReturnigList<T>(String spName, DynamicParameters param)
        {
            SqlConnection con = new SqlConnection("Data Source=A2NWPLSK14SQL-v02.shr.prod.iad2.secureserver.net; User Id=akbardiagnostic;Password=Password@1; Initial Catalog=akbardiagnostic");
            // var result = (T)Convert.ChangeType(con.Execute(spName, param, commandType: CommandType.StoredProcedure), typeof(T));
            return con.Query<T>(spName, param, commandType: CommandType.StoredProcedure);
        }

    }
}