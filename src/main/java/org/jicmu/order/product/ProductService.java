package org.jicmu.order.product;

import org.jicmu.order.product.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ProductService {

    Product addProduct(Product product);

    Optional<Product> findByNum(Long num);

    List<Product> findAll();

    Product updateProduct(Product product);

    Product deleteProduct(Product product);

}
