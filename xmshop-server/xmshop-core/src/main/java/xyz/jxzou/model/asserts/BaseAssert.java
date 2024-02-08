package xyz.jxzou.model.asserts;


import jakarta.annotation.Nullable;
import xyz.jxzou.common.model.Result;
import xyz.jxzou.model.exception.BaseException;

import java.util.Collection;

/**
 * BaseAssert
 *
 * @author jx
 */
public interface BaseAssert<E extends BaseException> extends Result {

    Result getResult();

    E newException(Object... args);

    E newException(Throwable t, Object... args);

    default void isNull(@Nullable Object obj) throws BaseException {
        if (obj == null) {
            throw this.newException();
        }
    }

    default void isNull(@Nullable Object obj, Throwable t) throws BaseException {
        if (obj == null) {
            throw this.newException(t);
        }
    }

    default void notNull(@Nullable Object obj) throws BaseException {
        if (obj != null) {
            throw this.newException();
        }
    }

    default void notNull(@Nullable Object obj, Throwable t) throws BaseException {
        if (obj != null) {
            throw this.newException(t);
        }
    }

    default void isEmpty(@Nullable String str) throws BaseException {
        if (str == null || str.isEmpty()) {
            throw this.newException();
        }
    }

    default void notEmpty(@Nullable String str, Throwable t) throws BaseException {
        if (str == null || str.isEmpty()) {
            throw this.newException(t);
        }
    }

    default void isBlank(@Nullable String str) throws BaseException {
        if (str == null || str.trim().isEmpty()) {
            throw this.newException();
        }
    }

    default void isBlank(@Nullable String str, Throwable t) throws BaseException {
        if (str == null || str.trim().isEmpty()) {
            throw this.newException(t);
        }
    }

    default void notBlank(@Nullable String str) throws BaseException {
        if (str != null && !str.trim().isEmpty()) {
            throw this.newException();
        }
    }

    default void notBlank(@Nullable String str, Throwable t) throws BaseException {
        if (str != null && !str.trim().isEmpty()) {
            throw this.newException(t);
        }
    }

    default void isEmpty(@Nullable Object[] array) throws BaseException {
        if (array == null || array.length == 0) {
            throw this.newException();
        }
    }

    default void isEmpty(@Nullable Object[] array, Throwable t) throws BaseException {
        if (array == null || array.length == 0) {
            throw this.newException(t);
        }
    }

    default void notEmpty(@Nullable Object[] array) throws BaseException {
        if (array != null && array.length > 0) {
            throw this.newException();
        }
    }

    default void notEmpty(@Nullable Object[] array, Throwable t) throws BaseException {
        if (array != null && array.length > 0) {
            throw this.newException(t);
        }
    }

    default void isEmpty(@Nullable Collection<?> collection) throws BaseException {
        if (collection == null || collection.isEmpty()) {
            throw this.newException();
        }
    }

    default void isEmpty(@Nullable Collection<?> collection, Throwable t) throws BaseException {
        if (collection == null || collection.isEmpty()) {
            throw this.newException(t);
        }
    }

    default void notEmpty(@Nullable Collection<?> collection) throws BaseException {
        if (collection != null && !collection.isEmpty()) {
            throw this.newException();
        }
    }

    default void notEmpty(@Nullable Collection<?> collection, Throwable t) throws BaseException {
        if (collection != null && !collection.isEmpty()) {
            throw this.newException(t);
        }
    }

    default void equalsIgnoreCase(@Nullable String str1, @Nullable String str2) throws BaseException {
        notBlank(str1);
        notBlank(str2);
        if (str1 != null && !str1.equalsIgnoreCase(str2)) {
            throw this.newException();
        }
    }

    default void equalsIgnoreCase(@Nullable String str1, @Nullable String str2, Throwable t) throws BaseException {
        notBlank(str1);
        notBlank(str2);
        if (str1 != null && !str1.equalsIgnoreCase(str2)) {
            throw this.newException(t);
        }
    }

    default void equals(@Nullable String str1, @Nullable String str2) throws BaseException {
        notBlank(str1);
        notBlank(str2);
        if (str1 != null && !str1.equals(str2)) {
            throw this.newException();
        }
    }

    default void equals(@Nullable String str1, @Nullable String str2, Throwable t) throws BaseException {
        notBlank(str1);
        notBlank(str2);
        if (str1 != null && !str1.equals(str2)) {
            throw this.newException(t);
        }
    }

    default void isInstanceOf(Class<?> type, @Nullable Object obj) throws BaseException {
        notNull(obj);
        if (type.isInstance(obj)) {
            throw this.newException();
        }
    }

    default void isInstanceOf(Class<?> type, @Nullable Object obj, Throwable t) throws BaseException {
        notNull(obj);
        if (type.isInstance(obj)) {
            throw this.newException(t);
        }
    }

    default void notInstanceOf(Class<?> type, @Nullable Object obj) throws BaseException {
        notNull(obj);
        if (!type.isInstance(obj)) {
            throw this.newException();
        }
    }

    default void notInstanceOf(Class<?> type, @Nullable Object obj, Throwable t) throws BaseException {
        notNull(obj);
        if (!type.isInstance(obj)) {
            throw this.newException(t);
        }
    }
}
