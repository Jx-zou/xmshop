package xyz.jxzou.common;

import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;
import xyz.jxzou.common.util.SnowFlake;

/**
 * The type SnowFlakeGenerator.
 *
 * @author Jx-zou
 */
public class SnowFlakeGenerator implements IdentifierGenerator {
    private final SnowFlake snowFlake = new SnowFlake();

    @Override
    public String generate(SharedSessionContractImplementor sharedSessionContractImplementor, Object o) {
        return String.valueOf(snowFlake.nextId());
    }
}
