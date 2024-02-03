package xyz.jxzou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Category;

/**
 * The type CategoryRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
}
