package uz.pdp.demo7.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Order {
    private Integer id = idGen++;
    private LocalDateTime dateTime = LocalDateTime.now();
    private OrderStatus orderStatus = OrderStatus.CREATED;
    private Integer userId;
    private static Integer idGen = 1;

    public Order(LocalDateTime dateTime, OrderStatus orderStatus) {
        this.dateTime = dateTime;
        this.orderStatus = orderStatus;
    }
}
