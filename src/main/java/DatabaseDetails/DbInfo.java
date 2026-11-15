package DatabaseDetails;

public interface DbInfo {
    String driver="com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/bookmanagment";
    String userName = System.getenv("DB_USERNAME");
    String password = System.getenv("DB_PASSWORD");
}
