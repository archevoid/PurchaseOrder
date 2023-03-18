package org.jicmu.order.product.impl;

import lombok.RequiredArgsConstructor;
import org.jicmu.order.product.ProductRepository;
import org.jicmu.order.product.entity.Part;
import org.jicmu.order.product.entity.Product;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class JpaProductRepository implements ProductRepository {

    private final EntityManager em;

    @Override
    public Product save(Product product) {
        em.persist(product);

        return em.find(Product.class, product.getNum());
    }

    @Override
    public Optional<Product> findByNum(Long num) {
        return Optional.ofNullable(em.find(Product.class, num));
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> findAll() {
        return em.createQuery("SELECT p FROM Product p").getResultList();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> findByPart(Part part) {
        return em.createQuery("SELECT pt FROM Product p INNER JOIN Part pt").getResultList();
    }

    @Override
    public Product update(Product product) {
        int success = em.createQuery("UPDATE Product p SET name = :name, part.num = :partNum WHERE num = :num")
                .setParameter("name", product.getName())
                .setParameter("partNum", product.getPart().getNum())
                .setParameter("num", product.getNum())
                .executeUpdate();

        if (success == 1) {
            Optional<Product> optionalProduct = findByNum(product.getNum());
            if (optionalProduct.isPresent()) {
                return optionalProduct.get();
            }
        }

        return product;
    }

}
