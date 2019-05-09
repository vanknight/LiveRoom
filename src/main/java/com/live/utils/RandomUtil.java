package com.live.utils;

import java.util.UUID;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/30 16:44
 * @description:
 */
public class RandomUtil {

    private static char chars_a[] = null;
    private static char chars_0[] = null;

    static {
        chars_a = new char[]{'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'};
        chars_0 = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    }


    public static String get32UUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static String get64UUID() {
        return UUID.randomUUID().toString().replace("-", "") + UUID.randomUUID().toString().replace("-", "");
    }

    public static String randomStreamName() {
        int maxLength = 32;
        int minLength = 16;
        StringBuffer string = new StringBuffer();
        int len = (int) Math.floor(Math.random() * 16 + 16);
        for (int i = 0; i < len; i++) {
            double step = .4987654321;
            boolean mark = (Math.random() * step) > (Math.random() * step);
            if (mark) {
                int _index = (int) Math.floor(Math.random() * (chars_0.length));
                string.append(chars_0[_index]);
            } else {
                int _index = (int) Math.floor(Math.random() * (chars_a.length));
                string.append(chars_a[_index]);
            }
        }
        return string.toString();
    }
}
