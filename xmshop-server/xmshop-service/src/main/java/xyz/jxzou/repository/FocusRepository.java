package xyz.jxzou.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Focus;

/**
 * The type FocusRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface FocusRepository extends JpaRepository<Focus, String> {
}
