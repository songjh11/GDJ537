package com.js.home.aop.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.js.home.aop.test.Card;
import com.js.home.aop.test.Transport;


@SpringBootTest
class TrasferTest {

	
	@Autowired
	private Transport transport;
	
	@Autowired
	private Card card;
	
	//@Test
	void test() {
		transport.airPlane();
		transport.getTaxi();
		transport.takeBus();
		transport.takeSubway();
		
	}

}
