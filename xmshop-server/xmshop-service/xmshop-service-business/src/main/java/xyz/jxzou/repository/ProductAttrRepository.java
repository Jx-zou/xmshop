package xyz.jxzou.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.ProductAttr;

/**
 * The type ProductAttrRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductAttrRepository extends R2dbcRepository<ProductAttr, String> {
}
