package xyz.jxzou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Product;

/**
 * The type ProductRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
}
