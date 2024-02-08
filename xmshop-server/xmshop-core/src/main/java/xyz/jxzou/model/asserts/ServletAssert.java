package xyz.jxzou.model.asserts;

import io.micrometer.common.util.StringUtils;
import org.springframework.lang.Nullable;
import xyz.jxzou.common.model.Result;
import xyz.jxzou.model.exception.ServletException;

/**
 * ServletAssert
 *
 * @author jx
 */
public interface ServletAssert extends BaseAssert<ServletException>, Result {
    @Override
    default ServletException newException(Object... args) {
        return new ServletException(this, args);
    }

    @Override
    default ServletException newException(Throwable t, Object... args) {
        return new ServletException(this, args, t);
    }

    default void validateClientId(@Nullable String cid) throws ServletException {
        if (null == cid || cid.length() != 24) {
            throw this.newException();
        }
    }

    default void validateToken(@Nullable String token) throws ServletException {
        if (StringUtils.isEmpty(token) || !token.startsWith("Bearer ")) {
            throw this.newException();
        }
    }
}
