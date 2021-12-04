package org.wl.config;

import org.wl.filter.JwtRequestFilter;
import org.wl.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyUserDetailsService myUserDetailService;
    @Autowired
    private JwtRequestFilter jwtRequestFilter;

    private static final String[] AUTH_WHITELIST = {
            // -- Swagger UI v2
            "/users/loginView",
            "/users/otp/**",
            "/users/mobile/otp/**",
            "/users/signUpOtp/**",
            "/users/logout",
            "/bookings/upcomming_dt/**",
            "/users/admin/email",
            "/users/common/email",
            "/bookings/COMPLETED/**",
            "/bookings/ongoing_dt/**",
            "/bookings/bookings_dt",
            "/bookings/pending_dt/**",
            "/bookings/history_dt/**",
            "/washingLove/**",
//            "/vehicletypes",
//            "/notifications",
//            "/notifications/**",
            "/users/signupView",
//            "/bookings/**",
//            "/packages/**",
//            "/washCenters/**",
//            "/users/**",
//            "/review_ratings/**",
            "/users/authentications",
            "/users/authentications_model",
            "/users/sign_up",
          //  "/washCenter/test",
            "/resources/**",
            "/dashboards/**",
            "/v2/api-docs",
            "/swagger-resources",
            "/swagger-resources/**",
            "/configuration/ui",
            "/configuration/security",
            "/swagger-ui.html",
            "/webjars/**",
            // -- Swagger UI v3 (OpenAPI)
            "/v2/api-docs/**",
            "/swagger-ui/**"
            // other public endpoints of your API may be appended to this array
    };

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(myUserDetailService);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Override
    @Bean
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests().antMatchers(AUTH_WHITELIST).permitAll().anyRequest().authenticated()
                .and().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
    }


}
