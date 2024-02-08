package xyz.jxzou.common.model;


/**
 * 消息接口
 */
public interface Result {

    /**
     * 获取消息
     *
     * @return 消息
     */
    String getMessage();

    /**
     * 获取状态码
     *
     * @return 状态码
     */
    Integer getStatus();
}
