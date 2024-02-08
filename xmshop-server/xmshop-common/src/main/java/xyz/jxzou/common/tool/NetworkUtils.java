package xyz.jxzou.common.tool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The type HttpUtils.
 *
 * @author Jx-zou
 */
public class NetworkUtils {
    private static final Logger log = LoggerFactory.getLogger(NetworkUtils.class);
    public static String getContent(String url) {
        InputStream is = null;
        try {
            URL u = new URL(url);
            is = u.openStream();
            is = new BufferedInputStream(is, 2048);
            byte[] bytes = new byte[2048];
            StringBuilder data = new StringBuilder();
            while (is.read(bytes) != -1) {
                data.append(new String(bytes, StandardCharsets.UTF_8));
            }
            Pattern pattern = Pattern.compile("\\s*|\t|\r|\n");
            Matcher matcher = pattern.matcher(data.toString());
            return matcher.replaceAll("");
        } catch (IOException e) {
            log.error("获取数据失败.", e);
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    log.error("输入流关闭失败.");
                }
            }
        }
        return "";
    }
}
