package org.jicmu.order.product.impl;

import lombok.RequiredArgsConstructor;
import org.jicmu.order.product.ProductRepository;
import org.jicmu.order.product.ProductService;
import org.jicmu.order.product.entity.Product;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    @Override
    public Product addProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Optional<Product> findByNum(Long num) {
        return productRepository.findByNum(num);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product updateProduct(Product product) {
        return productRepository.update(product);
    }

    @Override
    public Product deleteProduct(Product product) {
        return null;
    }

}
