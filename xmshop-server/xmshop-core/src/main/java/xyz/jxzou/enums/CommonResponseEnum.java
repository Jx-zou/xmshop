package xyz.jxzou.enums;


import xyz.jxzou.common.pojo.ResponseResult;
import xyz.jxzou.model.asserts.CommonAssert;

/**
 * CommonResponseEnum
 *
 * @author jx
 */
public enum CommonResponseEnum implements CommonAssert {

    SUCCESS(2000,"操作成功"),
    GET_SUCCESS(2100,"获取成功"),

    /**
     * 公共错误: [5000 -> 5099]
     */
    ERROR(5000, "操作失败"),
    SERVER_ERROR(5001, "服务错误"),
    NETWORK_ERROR(5002, "网络延迟"),
    GET_DATA_ERROR(5003, "获取数据"),
    /* 加密解密相关 */
    RSA_ENCRYPT_ERROR(5004, "RSA加密错误"),
    /* 数据库相关错误: [5020 -> 5039] */
    DATABASE_INSERT_ERROR(5021, "数据库insert失败"),

    /* 基本数据格式错误 */
    STRING_ERROR(5040, "字符串格式错误"),

    /* 杂项 */
    AUTH_GENERATE_CLIENT_ID_ERROR(5080, "生成clientID错误");

    private final Integer status;
    private final String message;

    CommonResponseEnum(int status, String message) {
        this.status = status;
        this.message = message;
    }

    @Override
    public Integer getStatus() {
        return this.status;
    }

    @Override
    public String getMessage() {
        return this.message;
    }

    @Override
    public ResponseResult<Void> getResult() {
        return new ResponseResult<Void>(status, message);
    }
}
