package edu.autocar.cleancity.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration	// 공통설정
@EnableWebMvc	// SpringMvc 활성화
@ComponentScan(basePackages= {"edu.autocar"})	// 빈 자동 등록
public class MvcConfig implements WebMvcConfigurer{
	public void addResourceHandlers(
						final ResourceHandlerRegistry registry) {
		// css, js, 이미지 등의 정적 파일 배치 위치 등록 - 스프링이 처리 안함
		registry.addResourceHandler("/resources/**") // 적용 경로
				.addResourceLocations("/resources/"); // 웹 경로
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		
		TilesViewResolver viewResolver = new TilesViewResolver();
		registry.viewResolver(viewResolver);
		// 뷰의 이름을 빈의 이름으로 해석하는 리졸러 설정
		registry.viewResolver(new BeanNameViewResolver());
		// JSP 뷰 리졸러 설정
		// 뷰 이름 앞,뒤에 붙일 prefix, surfix 설정
		registry.jsp("/WEB-INF/views/", ".jsp");
		
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(
				new String[] {"/WEB-INF/tiles/tiles-layout.xml"});
		tilesConfigurer.setCheckRefresh(true);
		
		return tilesConfigurer;
	}
	
}
