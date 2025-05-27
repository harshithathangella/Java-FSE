import java.sql.*;

public class TransferService {
    public static void transfer(int fromId, int toId, int amount) throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:sqlite:bank.db");
        conn.setAutoCommit(false);

        try {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("UPDATE accounts SET balance = balance - " + amount + " WHERE id = " + fromId);
            stmt.executeUpdate("UPDATE accounts SET balance = balance + " + amount + " WHERE id = " + toId);
            conn.commit();
        } catch (Exception e) {
            conn.rollback();
            System.out.println("Transaction failed. Rolled back.");
        } finally {
            conn.close();
        }
    }
}
