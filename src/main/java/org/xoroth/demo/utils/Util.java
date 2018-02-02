package org.xoroth.demo.utils;

import org.springframework.security.core.context.SecurityContextHolder;
import org.xoroth.demo.domain.User;

/**
 * Util
 */
public class Util {
    public static User getCurrentUser() {
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        return user;
    }
}
