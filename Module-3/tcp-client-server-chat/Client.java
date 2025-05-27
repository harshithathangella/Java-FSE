import java.io.*;
import java.net.*;

public class Client {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket("localhost", 1234);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

        BufferedReader userIn = new BufferedReader(new InputStreamReader(System.in));
        String msg;

        while ((msg = userIn.readLine()) != null) {
            out.println(msg);
            System.out.println(in.readLine());
        }

        socket.close();
    }
}
