public class TypeCastingExample {
    public static void main(String[] args) {
        double d = 9.78;
        int i = (int) d; // Explicit cast
        int j = 50;
        double newDouble = j; // Implicit cast

        System.out.println("Double to int: " + i);
        System.out.println("Int to double: " + newDouble);
    }
}
