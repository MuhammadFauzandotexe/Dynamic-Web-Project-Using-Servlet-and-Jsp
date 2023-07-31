package com.zan;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Optional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
    public static Optional<String> getCookieValue(HttpServletRequest request, String cookieName) throws UnsupportedEncodingException {
        Optional<String> cookieValue = Optional.empty();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    cookieValue = Optional.of(URLDecoder.decode(cookie.getValue(), "UTF-8"));
                    break;
                }
            }
        }
        return cookieValue;
    }
}
