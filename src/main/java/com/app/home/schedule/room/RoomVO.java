package com.app.home.schedule.room;

import lombok.Data;

@Data
public class RoomVO
{
	// id, name, max(int), contents, location
	private String id;
	private String name;
	private int max;
	private String contents;
	private String location;
}
