package org.mettarche.order.product.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter @Setter
public class Product {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long num;
    private String name;
    @ManyToOne @JoinColumn
    private Part part;

}
