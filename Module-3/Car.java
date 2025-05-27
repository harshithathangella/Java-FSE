public class Car {
    String make, model;
    int year;

    public void displayDetails() {
        System.out.println("Car: " + make + " " + model + " (" + year + ")");
    }

    public static void main(String[] args) {
        Car c = new Car();
        c.make = "Toyota";
        c.model = "Camry";
        c.year = 2020;
        c.displayDetails();
    }
}
