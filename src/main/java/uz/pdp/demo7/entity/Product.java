package uz.pdp.demo7.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Product {
    private Integer id = idGen++;
    private String name;
    private Integer price;
    private Integer categoryId;
    private String photoUrl;
    private static Integer idGen = 1;

    public Product(String name, Integer price, Integer categoryId, String photoUrl) {
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.photoUrl = photoUrl;
    }
}
