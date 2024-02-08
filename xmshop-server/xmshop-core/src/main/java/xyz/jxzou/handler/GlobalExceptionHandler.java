package xyz.jxzou.handler;

import jakarta.validation.ValidationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.async.AsyncRequestTimeoutException;
import xyz.jxzou.common.pojo.ResponseResult;
import xyz.jxzou.enums.ArgumentResponseEnum;
import xyz.jxzou.enums.CommonResponseEnum;
import xyz.jxzou.enums.ServletResponseEnum;
import xyz.jxzou.message.UnifiedMessageSource;
import xyz.jxzou.model.exception.*;

/**
 * GlobalExceptionHandler
 *
 * @author jx
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final String ENV_PROD = "prod";

    private final UnifiedMessageSource unifiedMessageSource;

    @Value("${spring.profiles.active}")
    private String profile;

    /**
     * Instantiates a new Global exception handler.
     *
     * @param unifiedMessageSource the unified message source
     */
    @Autowired
    public GlobalExceptionHandler(UnifiedMessageSource unifiedMessageSource) {
        this.unifiedMessageSource = unifiedMessageSource;
    }

    private String getMessage(Integer code) {
        String message = unifiedMessageSource.getMessage(code);
        if (message == null || message.isEmpty()) {
            return CommonResponseEnum.SERVER_ERROR.getMessage();
        }
        return message;
    }

    private String getMessage(BaseException e) {
        String message = unifiedMessageSource.getMessage(e.getResult().getStatus(), e.getArgs());
        if (message == null || message.isEmpty()) {
            return e.getMessage();
        }
        return message;
    }

    private final boolean isProd = ENV_PROD.equals(profile);

    /**
     * Handle argument exception response result.
     *
     * @param e the e
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ArgumentException.class)
    public ResponseResult<Void> handleArgumentException(ArgumentException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.NETWORK_ERROR.getResult();
        }
        return new ResponseResult<>(e.getResult().getStatus(), getMessage(e));
    }

    /**
     * Handle common exception response result.
     *
     * @param e common异常
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(CommonException.class)
    public ResponseResult<Void> handleCommonException(CommonException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.NETWORK_ERROR.getResult();
        }
        return new ResponseResult<>(e.getResult().getStatus(), getMessage(e));
    }

    /**
     * Handle servlet exception response result.
     *
     * @param e servlet异常
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ServletException.class)
    public ResponseResult<Void> handleServletException(ServletException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.NETWORK_ERROR.getResult();
        }
        return new ResponseResult<Void>(e.getResult().getStatus(), getMessage(e));
    }

    /**
     * Handle business exception response result.
     *
     * @param e business异常
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BusinessException.class)
    public ResponseResult<Void> handleBusinessException(BusinessException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.NETWORK_ERROR.getResult();
        }
        return new ResponseResult<>(e.getResult().getStatus(), getMessage(e));
    }

    /**
     * Handle base exception response result.
     *
     * @param e the e
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BaseException.class)
    public ResponseResult<Void> handleBaseException(BaseException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.NETWORK_ERROR.getResult();
        }
        return new ResponseResult<>(e.getResult().getStatus(), getMessage(e));
    }

    /**
     * Handle base exception response result.
     *
     * @param e the e
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ValidationException.class)
    public ResponseResult<Void> handleValidationException(ValidationException e) {
        log.error(e.getMessage(), e);
        if (isProd) {
            return CommonResponseEnum.ERROR.getResult();
        }
        return new ResponseResult<>(ArgumentResponseEnum.VALID_ERROR.getStatus(), e.getMessage());
    }

    /**
     * Handle servlet exception response result.
     *
     * @param e the e
     * @return the response result
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler({
            HttpMessageNotReadableException.class,
            HttpMessageNotWritableException.class,
            TypeMismatchException.class,
            BindException.class,
            MethodArgumentNotValidException.class,
            ConversionNotSupportedException.class,
            AsyncRequestTimeoutException.class
    })
    public ResponseResult<Void> handleServletException(Exception e) {
        log.error(e.getMessage(), e);
        Integer status = CommonResponseEnum.SERVER_ERROR.getStatus();

        if (isProd) {
            String message = getMessage(status);
            return new ResponseResult<>(status, message);
        }

        try {
            ServletResponseEnum servletExceptionEnum = ServletResponseEnum.valueOf(e.getClass().getSimpleName());
            status = servletExceptionEnum.getStatus();
        } catch (IllegalArgumentException exception) {
            log.error("class [{}] not defined in enum {}", e.getClass().getName(), ServletResponseEnum.class.getName());
        }

        return new ResponseResult<>(status, e.getMessage());
    }

    /**
     * Handle exception response result.
     *
     * @param e 异常
     * @return 响应实例
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(Exception.class)
    public ResponseResult<Void> handleException(Exception e) {
        log.error(e.getMessage(), e);
        return CommonResponseEnum.ERROR.getResult();
    }
}
