package xyz.jxzou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.ProductAttr;

/**
 * The type ProductAttrRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface ProductAttrRepository extends JpaRepository<ProductAttr, String> {
}
