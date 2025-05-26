import java.util.*;

record Person(String name, int age) {}

public class RecordExample {
    public static void main(String[] args) {
        List<Person> people = List.of(
            new Person("Alice", 30),
            new Person("Bob", 22)
        );

        for (Person p : people) {
            if (p.age() >= 25) {
                System.out.println(p);
            }
        }
    }
}
