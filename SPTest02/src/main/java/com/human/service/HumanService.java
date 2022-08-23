package com.human.service;

import java.util.List;

import com.human.dto.HumanDto;

public interface HumanService {
	public void create(HumanDto dto) throws Exception;

	public HumanDto read(String name) throws Exception;

	public void delete(String name) throws Exception;

	public void update(HumanDto dto) throws Exception;

	public List<HumanDto> list() throws Exception;
}
