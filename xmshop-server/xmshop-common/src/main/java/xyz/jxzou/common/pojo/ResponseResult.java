package xyz.jxzou.common.pojo;

import lombok.Data;
import xyz.jxzou.common.model.Result;

/**
 * 响应统一回复类
 *
 * @param <T> 携带数据类型
 */
@Data
public class ResponseResult<T> implements Result {

    private final Integer status;
    private final String message;
    private T data;

    public ResponseResult(Integer status, String message) {
        this.status = status;
        this.message = message;
    }

    public ResponseResult(Integer status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }
}
