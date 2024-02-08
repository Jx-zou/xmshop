package xyz.jxzou.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.ProductDetails;

/**
 * The type ProductDetailsRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductDetailsRepository extends R2dbcRepository<ProductDetails, String> {
}
