package uz.pdp.demo7.db;

import uz.pdp.demo7.entity.*;

import java.util.ArrayList;
import java.util.List;

public interface DB {
    static String absolutePath = "/Users/user/IdeaProjects/demo5/";
    List<User> USERS = new ArrayList<>(List.of(
            new User("Zafar", "Tangirov","+998901234567", "123", "USER"),
            new User("Shahboz", "Tangirov", "+998907654321", "1234", "USER"),
            new User("admin", "adminjonov", "+998717007070", "12345", "ADMIN")
    ));

    List<Category> CATEGORIES = new ArrayList<>(List.of(
            new Category("Yeguliklar"),
            new Category("Ichimliklar"),
            new Category("Kiyim-kechaklar")
    ));
    List<Product> PRODUCTS = new ArrayList<>(List.of(
            new Product("Olma", 5000, 1, absolutePath+"files/apple.jpg"),
            new Product("Anor", 7000, 1, absolutePath + "files/pomegranate.jpg"),
            new Product("Ananas", 5000, 1, absolutePath+"files/ananas.jpg"),
            new Product("Cola", 9000, 2, absolutePath+"files/cola.jpg"),
            new Product("Fanta", 9000, 2, absolutePath+"files/fanta.jpg"),
            new Product("Moxito", 15000, 2, absolutePath+"files/moxito.jpg"),
            new Product("Kepka", 15000, 3, absolutePath+"files/cap.jpg"),
            new Product("Kurtka", 15000, 3, absolutePath+"files/kurtka.jpg"),
            new Product("Krossovka", 15000, 3, absolutePath+"files/krossovka.jpg")
    ));
    List<Order> ORDERS = new ArrayList<>();
    List<OrderItem> ORDER_ITEMS = new ArrayList<>();
}
