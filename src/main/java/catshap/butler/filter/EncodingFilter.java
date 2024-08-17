package catshap.butler.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 작업이 필요하면 여기에 구현
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI();
        
        // CSS, JS, 이미지 파일 등을 제외
        if (path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".svg") || path.endsWith(".png") || path.endsWith(".jpg") || path.endsWith(".gif")) {
            chain.doFilter(request, response);
        } else {
            // 텍스트 파일인 경우에만 인코딩 설정
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");

            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // 필터 종료 시 정리 작업이 필요하면 여기에 구현
    }
}
