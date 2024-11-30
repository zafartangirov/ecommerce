package uz.pdp.demo7.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Basket {
    private Map<Product, Integer> basket = new HashMap<>();
}
