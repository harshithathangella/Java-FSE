import java.sql.*;

public class StudentDAO {
    public static void insertStudent(String name, int age) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:sqlite:students.db");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO students(name, age) VALUES (?, ?)");
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.executeUpdate();
        conn.close();
    }

    public static void updateStudent(int id, String newName) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:sqlite:students.db");
        PreparedStatement ps = conn.prepareStatement("UPDATE students SET name = ? WHERE id = ?");
        ps.setString(1, newName);
        ps.setInt(2, id);
        ps.executeUpdate();
        conn.close();
    }
}
