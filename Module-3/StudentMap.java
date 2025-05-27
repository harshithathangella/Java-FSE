import java.util.HashMap;
import java.util.Scanner;

public class StudentMap {
    public static void main(String[] args) {
        HashMap<Integer, String> map = new HashMap<>();
        Scanner sc = new Scanner(System.in);

        map.put(101, "Alice");
        map.put(102, "Bob");

        System.out.print("Enter student ID: ");
        int id = sc.nextInt();
        String name = map.get(id);

        if (name != null)
            System.out.println("Student: " + name);
        else
            System.out.println("ID not found.");
    }
}
