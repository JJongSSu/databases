import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MiniProjectConnectMysql {
    public static void main(String[] args) {
        // VS code에서 폴더 만들기, class 파일 만들기
        // MySQL 열기
        // mysql-connector J(Java projects-referenced lib 연결)
        // connect to database 클릭
        // connection method, hostname : localhost, port, username, password, default
        // schema : 원하는 database 이름 -> 항목 입력확인
        final String USER = "root";
        final String PASS = "tbrs00002b";
        final String DB_URL = "jdbc:mysql://localhost/world";
        // jdbc:mysql://localhost/world
        // jdbc: java database connection
        // jdbc:mysql(TCP/IP)
        // localhost(hostname,port)
        // world(default schema)
        // connection 안되었을 때 예외처리 필요 -> try/catch 문 사용
        // -> pw입력 후 mysql 들어갔을 때까지의 명령어
        String QUERY = "select ID, Name, Population " + "from city " + "where 1=1 " + "and Name Like %an% "; 
        // 끝나는 부분에 space 입력해줘야함
        try {
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement stmt = conn.createStatement(); // MySQL Query창 띄우는 명령어
            // insert
            // int id = 323214; // ID 최대값 불러오기 -> values ID에 id+1 넣어서 자동으로 생성되게 만들기
            QUERY = "insert into city(ID, Name, CountryCode, District, Population) " + 
                    "values (98765, 'Name', 'AFG', 'amaha', 500) ";
            int val = stmt.executeUpdate(QUERY);   // MySQL에서 Action Output 역할
            // select
            QUERY = "select ID, Name, CountryCode, District, Population " + "from city " + "where Name = 'Name' ";
            ResultSet rs = stmt.executeQuery(QUERY); 
            while (rs.next()) {
                System.out.print("ID: " + rs.getInt("ID"));
                System.out.print(", Name: " + rs.getString("Name"));
                System.out.print(", Population: " + rs.getInt("Population"));
            }
            // update
            QUERY = "update city " + "set Population = 2000 " + "where Name = 'Name' ";
            val = stmt.executeUpdate(QUERY);
            // select
            System.out.println();
            // delete
            QUERY = "delete from city " + "where Name = 'Name' ";
            val = stmt.executeUpdate(QUERY);
            // select
            System.out.println();

            // 새로운 query 생성, 먼저 select 명령문 입력 후 test 해보기
            // rs = stmt.executeQuery(QUERY); // 한 공간에 똑같은 이름으로 변수를 선언할 수 없기 때문에 ResultSet 지워줘야 됨
            // // Query안에 명령어를 입력하기 위해서 stmt 사용(stmt가 Query창을 띄우는 class이기 때문에)
            // // result grid, action output 확인 -> Line by line 방식으로 읽어주는 코드 작성필요(whlie문 사용)
            // while (rs.next()) {
            //     // Retrieve by column name, column datatype확인
            //     System.out.print("ID: " + rs.getInt("ID"));
            //     System.out.print(", Name: " + rs.getString("Name"));
            //     System.out.print(", Population: " + rs.getInt("Population"));
            // }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }
}