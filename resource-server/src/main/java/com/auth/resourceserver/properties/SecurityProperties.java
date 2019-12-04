package com.auth.resourceserver.properties;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.io.Resource;

/**
 * Class to bind custom configuration properties
 */
@ConfigurationProperties("security")
public class SecurityProperties {

    @Getter
    @Setter
    private JwtProperties jwt;

    @Data
    public static class JwtProperties {
        private Resource publicKey;
    }
}
