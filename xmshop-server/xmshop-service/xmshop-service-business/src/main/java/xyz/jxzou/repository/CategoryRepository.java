package xyz.jxzou.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Category;

/**
 * The type CategoryRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface CategoryRepository extends R2dbcRepository<Category, String> {
}
