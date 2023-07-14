package com.test.persistence;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/Spring/root-context.xml")
@Log4j
public class DBCPTest {

	@Autowired	
	private DataSource dataSource; //기본값이 10개의 커넥션 있음 > 이미 관리되고 있는 커넥션을 꺼내서 쓰기만 하면 됨
	
	@Test
	public void testConnection() {
		
		assertNotNull(dataSource);
		
		try {
			
			//이걸 세팅하면 다수의 사용자가 동시에 DB를 사용할 때 오류나지 않음 > 열고닫고를 최소화하기 때문에 분배해서 조절해줌
			//10개가 전부 사용되고 11번째 사람이 온다면 앞에서 누군가 반납할때까지 기다려야 함 > 하지만 대기는 잘 안함
			Connection conn = dataSource.getConnection();	//DBCP가 관리하고 있는 10개 커넥션 중 1번째 커넥션 던져줌
			
			log.info(conn.isClosed()); 	//잘 연결돼있는지 확인
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
