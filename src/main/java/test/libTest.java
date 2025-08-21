package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class libTest {
	private static final Logger logger = LoggerFactory.getLogger(libTest.class);

    public static void main(String[] args) {
        // HikariCP 설정
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:mysql://localhost:3306/testdb"); // DB명(testdb) → 실제 DB명으로 교체
        config.setUsername("root"); // 사용자 계정
        config.setPassword("1234"); // 비밀번호
        config.setMaximumPoolSize(5);

        try (HikariDataSource ds = new HikariDataSource(config);
             Connection conn = ds.getConnection();
             Statement stmt = conn.createStatement()) {

            logger.info("✅ HikariCP + MySQL 연결 성공!");
            
            // 간단한 쿼리 실행
            ResultSet rs = stmt.executeQuery("SELECT NOW()");
            if (rs.next()) {
                logger.info("DB 응답 시간: {}", rs.getString(1));
            }

        } catch (Exception e) {
            logger.error("❌ 라이브러리/DB 연결 실패: {}", e.getMessage(), e);
        }
    }
}
