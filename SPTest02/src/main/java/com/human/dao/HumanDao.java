package com.human.dao;

import java.util.List;

import com.human.dto.HumanDto;

public interface HumanDao {
	public void create(HumanDto human) throws Exception;

	public HumanDto read(String name) throws Exception;

	public void update(HumanDto human) throws Exception;

	public void delete(String name) throws Exception;

	public List<HumanDto> list() throws Exception;
}
