package org.jicmu.order.product;

import org.jicmu.order.product.entity.Part;
import org.jicmu.order.product.entity.Product;

import java.util.List;
import java.util.Optional;

public interface ProductRepository {

    Product save(Product product);

    Optional<Product> findByNum(Long num);

    List<Product> findAll();

    List<Product> findByPart(Part part);

    Product update(Product product);

}
