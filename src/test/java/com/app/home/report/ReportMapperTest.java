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
		for(Long i=3L; i<129; i++) {
			
			ReportVacaVO reportVacaVO = new ReportVacaVO();
			reportVacaVO.setCall(01012341234L);
			reportVacaVO.setCategoryNum(1L);
			reportVacaVO.setDepName("ROLE_MAKER");
			reportVacaVO.setDepNum(4);
			reportVacaVO.setApplyNum(i);
			reportVacaVO.setText("사유"+i);
			reportVacaVO.setPeriod("3일");
			
			if(i == 50L) {
				Thread.sleep(50000);
			}
			reportService.setAddVaca(reportVacaVO);
		}
	}

}
