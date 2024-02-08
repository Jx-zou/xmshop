package xyz.jxzou.enums;


import xyz.jxzou.common.pojo.ResponseResult;
import xyz.jxzou.model.asserts.BusinessAssert;

/**
 * BusinessResponseEnum
 *
 * @author jx
 */
public enum BusinessResponseEnum implements BusinessAssert {
    ACCOUNT_ERROR(5201,"无效账户"),
    USERID_ERROR(5202,"无效用户ID"),
    MAIL_BOX_ERROR(5203,"无效邮箱"),
    CAPTCHA_ERROR(5204,"无效验证码"),
    REGISTRY_PASSWORD_ERROR(5222, "无效密码"),
    REGISTRY_DESCRIPTION_ERROR(5223, "无效介绍"),
    REGISTRY_NICKNAME_ERROR(5223, "无效昵称"),


    MAIL_SEND_ERROR(5202,"邮件发送失败"),
    MAIL_RESEND_ERROR(5203,"验证码已存在"),
    CAPTCHA_EXPIRE_ERROR(5205,"过期验证码"),
    REGISTRY_SUCCESS(2200, "注册成功"),
    REGISTRY_ERROR(5220, "注册失败"),
    REGISTRY_AUTHORIZATION_ERROR(5239, "授权失败"),
    ARTICLE_SUCCESS(2220, "操作成功"),
    REDIS_EXPIRE_ERROR(5260, "redis过期错误");


    private final Integer status;
    private final String message;

    BusinessResponseEnum(Integer status, String message) {
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
