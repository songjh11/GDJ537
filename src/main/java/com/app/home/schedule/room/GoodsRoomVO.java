package com.app.home.schedule.room;

import java.util.List;

import com.app.home.schedule.goods.ReserveVO;

import lombok.Data;

@Data
public class GoodsRoomVO extends ReserveVO
{
	private List<ReserveVO> reserveVOs;
}
