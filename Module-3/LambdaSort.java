import java.util.*;

public class LambdaSort {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("Banana", "Apple", "Cherry");
        Collections.sort(list, (a, b) -> a.compareToIgnoreCase(b));
        System.out.println("Sorted List: " + list);
    }
}
