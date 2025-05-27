import java.util.Scanner;

public class ArraySumAverage {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("How many numbers? ");
        int n = sc.nextInt();

        int[] arr = new int[n];
        int sum = 0;

        for(int i = 0; i < n; i++) {
            System.out.print("Enter number " + (i+1) + ": ");
            arr[i] = sc.nextInt();
            sum += arr[i];
        }

        double avg = (double) sum / n;
        System.out.println("Sum: " + sum + ", Average: " + avg);
    }
}
