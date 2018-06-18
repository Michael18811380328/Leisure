package com.dbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection  {
	//sql server
		private final String DBDRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		private final String DBURL="jdbc:sqlserver://localhost:1433;user=sa;password=123456;database=Leisure";
	/*	private final String DBUSER="sa";
		private final String DBPWD="123123";*/
		Connection conn=null;
		public DBConnection() {
			try {
				Class.forName(DBDRIVER);
				conn=DriverManager.getConnection(DBURL);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public Connection getConnection(){
			return this.conn;
		}
		public void close(){
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

}
