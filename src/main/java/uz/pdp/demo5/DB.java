package uz.pdp.demo5;

import uz.pdp.demo5.entity.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DB {
    List<User> USERS = new ArrayList<>(List.of(
            new User("Zafar", "Tangirov","+998901234567", "123"),
            new User("Shahboz", "Tangirov", "+998907654321", "1234")
    ));

    Map<Product, Integer> basket = new HashMap<>();
    List<Category> CATEGORIES = new ArrayList<>();
    List<Product> PRODUCTS = new ArrayList<>();
    List<Order> ORDERS = new ArrayList<>();
    List<OrderItem> ORDER_ITEMS = new ArrayList<>();
}
