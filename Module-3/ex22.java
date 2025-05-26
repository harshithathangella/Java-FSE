import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class FileWrite {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter text to write to file: ");
        String text = sc.nextLine();

        try (FileWriter fw = new FileWriter("output.txt")) {
            fw.write(text);
            System.out.println("Written to output.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

