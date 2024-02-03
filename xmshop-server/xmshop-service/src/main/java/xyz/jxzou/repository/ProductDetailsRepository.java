package xyz.jxzou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.ProductDetails;

/**
 * The type ProductDetailsRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductDetailsRepository extends JpaRepository<ProductDetails, String> {
}
