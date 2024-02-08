package xyz.jxzou.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import xyz.jxzou.entity.Focus;

/**
 * The type FocusRepository.
 *
 * @author Jx-zou
 */
@Repository
public interface FocusRepository extends R2dbcRepository<Focus, String> {
}
