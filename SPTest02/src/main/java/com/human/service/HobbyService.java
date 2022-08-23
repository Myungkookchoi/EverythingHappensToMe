package com.human.service;

import java.util.List;

import com.human.dto.HobbyDto;

public interface HobbyService {
	public void create(HobbyDto dto) throws Exception;

	public List<HobbyDto> read(String name) throws Exception;

	public void update(HobbyDto dto) throws Exception;

	public void delete(String name) throws Exception;

	public List<HobbyDto> list(String name) throws Exception;
}
