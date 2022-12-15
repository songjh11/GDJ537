package com.app.home.report;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.app.home.report.vaca.ReportVacaVO;

@SpringBootTest
class ReportMapperTest {
	
	@Autowired
	private ReportService reportService;
	
	@Test
	void test() throws Exception {
		for(Long i=1L; i<100; i++) {
			
			ReportVacaVO reportVacaVO = new ReportVacaVO();
			reportVacaVO.setCall(01012341234L);
			reportVacaVO.setCategoryNum(1L);
			reportVacaVO.setDepName("ROLE_MAKER");
			reportVacaVO.setName("류형민");
			reportVacaVO.setRoleName("사원");
			reportVacaVO.setDepNum(4);
			reportVacaVO.setApplyNum(i);
			reportVacaVO.setText("사유"+i);
			reportVacaVO.setStartDate("2022-12-14T15:21");
			reportVacaVO.setEndDate("2022-12-15T15:21");
			reportVacaVO.setId(1209);
			reportVacaVO.setReportNum(1);
			
			if(i == 50L) {
				Thread.sleep(5000);
			}
			reportService.setAddVaca(reportVacaVO);
		}
	}
	
	//@Test
	void test2() throws Exception {
		for(Long i=1L; i<10; i++) {
			
			ReportVacaVO reportVacaVO = new ReportVacaVO();
			reportVacaVO.setCall(012737334l);
			reportVacaVO.setCategoryNum(5L);
			reportVacaVO.setDepName("1ROLE_하이");
			reportVacaVO.setDepNum(8);
			reportVacaVO.setApplyNum(i);
			reportVacaVO.setText("기타"+i);
//			reportVacaVO.setPeriod("10일");
			
			if(i == 50L) {
				Thread.sleep(50000);
			}
			reportService.setAddVaca(reportVacaVO);
		}
	}

}
