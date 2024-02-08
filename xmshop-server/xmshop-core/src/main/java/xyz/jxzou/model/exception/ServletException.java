package xyz.jxzou.model.exception;

import xyz.jxzou.common.model.Result;

import java.io.Serial;
import java.io.Serializable;

/**
 * ServletException
 *
 * @author jx
 */
public class ServletException extends BaseException implements Serializable {

    @Serial
    private static final long serialVersionUID = 6362564704155960407L;

    public ServletException(Result responseEnum, Object[] args) {
        super(responseEnum, args);
    }

    public ServletException(Result responseEnum, Object[] args, Throwable cause) {
        super(responseEnum, args, cause);
    }
}
