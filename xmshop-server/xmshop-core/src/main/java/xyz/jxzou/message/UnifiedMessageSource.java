package xyz.jxzou.message;

import org.springframework.boot.autoconfigure.context.MessageSourceProperties;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Component;

import java.util.Locale;

/**
 * UnifiedMessageSource
 *
 * @author jx
 */
@Component
public class UnifiedMessageSource extends ReloadableResourceBundleMessageSource {

    private static final Locale defaultLocale = Locale.getDefault();

    private static final String codePrefix = "response.";

    /**
     * Instantiates a new Unified message source.
     *
     * @param messageSourceProperties the message source properties
     */
    public UnifiedMessageSource(MessageSourceProperties messageSourceProperties){
        super.setBasename(messageSourceProperties.getBasename());
        super.setDefaultEncoding(messageSourceProperties.getEncoding().name());
        super.setDefaultLocale(defaultLocale);
    }

    /**
     * Get message string.
     *
     * @param code the code
     * @param args the args
     * @return the string
     */
    public String getMessage(Integer code, Object[] args){
        return super.getMessage(codePrefix + code, args, defaultLocale);
    }

    /**
     * Get message string.
     *
     * @param code the code
     * @return the string
     */
    public String getMessage(Integer code){
        return super.getMessage(codePrefix + code, null, defaultLocale);
    }
}
