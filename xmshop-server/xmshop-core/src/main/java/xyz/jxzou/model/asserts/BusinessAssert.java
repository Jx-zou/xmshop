package xyz.jxzou.model.asserts;

import io.micrometer.common.util.StringUtils;
import xyz.jxzou.common.tool.ValidatorUtils;
import xyz.jxzou.model.exception.BusinessException;

/**
 * BusinessAssert
 *
 * @author jx
 */
public interface BusinessAssert extends BaseAssert<BusinessException> {

    @Override
    default BusinessException newException(Object... args) {
        return new BusinessException(this, args);
    }

    @Override
    default BusinessException newException(Throwable t, Object... args) {
        return new BusinessException(this, args, t);
    }

    default boolean validateSql(String param) {
        return StringUtils.isNotBlank(param) && !param.startsWith("or") && !param.startsWith("and") && !param.contains(";");
    }

    default void validateAccount(String account) throws BusinessException {
        if (StringUtils.isBlank(account) || account.length() != 32) {
            throw this.newException();
        }
    }

    default void validateCaptcha(String captcha, int size) throws BusinessException {
        if (StringUtils.isBlank(captcha) || captcha.length() != size || !ValidatorUtils.isMailCaptcha(captcha)) {
            throw this.newException();
        }
    }

    default void validateMail(String mail) throws BusinessException {
        if (StringUtils.isBlank(mail) || !ValidatorUtils.isEmail(mail)) {
            throw this.newException();
        }
    }

    default void validatePassword(String password) throws BusinessException {
        if (StringUtils.isBlank(password) || !ValidatorUtils.isPassword(password)) {
            throw this.newException();
        }
    }

    default void validateDescription(String desc) throws BusinessException {
        if (StringUtils.isNotBlank(desc) && !ValidatorUtils.isDesc(desc)) {
            throw this.newException();
        }
    }

    default void validateNickname(String nickname) throws BusinessException {
        if (StringUtils.isNotBlank(nickname) && !ValidatorUtils.isNickname(nickname)) {
            throw this.newException();
        }
    }
}
