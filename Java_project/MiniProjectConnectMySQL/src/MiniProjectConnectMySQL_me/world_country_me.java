package MiniProjectConnectMySQL_me;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class world_country_me {
    public static void main(String[] args) {
        final String USER = "root";
        final String PASS = "tbrs00002b";
        final String DB_URL = "jdbc:mysql://localhost/world";
        String QUERY = "select Code, Capital, Name, GNP " + "from country " + "where 1=1 " + "and Name like '%an%'";
        try {
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(QUERY);
            while (rs.next()) {
                System.out.print("Code: " + rs.getString("Code"));
                System.out.print(", Capital: " + rs.getInt("Capital"));
                System.out.print(", Name: " + rs.getString("Name"));
                System.out.print(", GNP: " + rs.getString("GNP"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }
}
