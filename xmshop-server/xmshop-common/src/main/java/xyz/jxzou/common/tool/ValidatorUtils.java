package xyz.jxzou.common.tool;

import java.util.regex.Pattern;

public class ValidatorUtils {

    public static final String REGEX_NICKNAME = "^[a-zA-Z\\u4e00-\\u9fa5!@#%&_-|]{1,15}$";
    public static final String REGEX_PASSWORD = "(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#%&_])^[A-Za-z\\d!@#%&_]{8,20}$";
    public static final String REGEX_MOBILE = "^((17[0-9])|(14[0-9])|(13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    public static final String REGEX_EMAIL = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    public static final String REGEX_CHINESE = "^[\u4e00-\u9fa5],*$";
    public static final String REGEX_ID_CARD = "(^\\d{18}$)|(^\\d{15}$)";
    public static final String REGEX_URL = "http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    public static final String REGEX_IP_ADDR = "^((\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5])\\.){3}(\\d|[1-9]\\d|1\\d\\d|2[0-4]\\d|25[0-5])$";
    public static final String REGEX_MAIL_CAPTCHA = "^[0-9]{6}$";
    private static final String REGEX_DESCRIPTION = "^((?!and)(?!or).)[^'\"]{0,110}$";

    public static boolean isNickname(String nickname) {
        return Pattern.matches(REGEX_NICKNAME, nickname);
    }

    public static boolean isPassword(String password) {
        return Pattern.matches(REGEX_PASSWORD, password);
    }

    public static boolean isMobile(String mobile) {
        return Pattern.matches(REGEX_MOBILE, mobile);
    }

    public static boolean isEmail(String email) {
        return Pattern.matches(REGEX_EMAIL, email);
    }

    public static boolean isChinese(String chinese) {
        return Pattern.matches(REGEX_CHINESE, chinese);
    }

    public static boolean isIDCard(String idCard) {
        return Pattern.matches(REGEX_ID_CARD, idCard);
    }

    public static boolean isUrl(String url) {
        return Pattern.matches(REGEX_URL, url);
    }

    public static boolean isIPAddr(String ipAddr) {
        return Pattern.matches(REGEX_IP_ADDR, ipAddr);
    }

    public static boolean isMailCaptcha(String captcha) {
        return Pattern.matches(REGEX_MAIL_CAPTCHA, captcha);
    }

    public static boolean isDesc(String desc) {
        return Pattern.matches(REGEX_DESCRIPTION, desc);
    }
}
