package xyz.jxzou.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Product;

/**
 * The type ProductRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductRepository extends R2dbcRepository<Product, String> {
}
