package org.wl.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
//import springfox.documentation.swagger2.annotations.EnableSwagger2;
//import springfox.documentation.swagger2.annotations.EnableSwagger2WebFlux;
//import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

//import static com.google.common.collect.Lists.newArrayList;
import static springfox.documentation.schema.AlternateTypeRules.newRule;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

//    @Autowired
//    private TypeResolver typeResolver;

//    @PostConstruct
//    public void postConstruct() {
//
//    }

    @Bean
    public Docket consumerSwaggerConfiguration() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }
//
//    private ApiKey apiKey() {
//        return new ApiKey(
//                "Authorization",
//                "Authorization",
//                "header");
//    }
//
//    private ApiInfo getApiInfo() {
//        return new ApiInfo("WASHING LOVE API Documentation",
//                "WASHING LOVE API Manager",
//                "v1.0",
//                "in-app-purchase",
//                new Contact("", "", "silvachathuri87@gmail.com"),
//                "MIT Licences",
//                "",
//                Collections.emptyList());
//    }

//    private SecurityContext securityContext() {
//        return SecurityContext.builder()
//                .securityReferences(defaultAuth())
//                .forPaths(PathSelectors.any())
//                .build();
//    }

//    List<SecurityReference> defaultAuth() {
//        AuthorizationScope authorizationScope
//                = new AuthorizationScope("global", "accessEverything");
//        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
//        authorizationScopes[0] = authorizationScope;
//        return new ArrayList(
//                new SecurityReference("Authorization", authorizationScopes));
//    }

}
