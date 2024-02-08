package xyz.jxzou.model.exception;

import xyz.jxzou.common.model.Result;

import java.io.Serial;
import java.io.Serializable;

/**
 * BusinessException
 *
 * @author jx
 */
public class BusinessException extends BaseException implements Serializable {

    @Serial
    private static final long serialVersionUID = 7373277090924206609L;

    public BusinessException(Result responseEnum, Object[] args) {
        super(responseEnum, args);
    }

    public BusinessException(Result responseEnum, Object[] args, Throwable cause) {
        super(responseEnum, args, cause);
    }
}
