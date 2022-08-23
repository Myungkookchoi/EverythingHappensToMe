package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dto.HobbyDto;
import com.human.dao.HobbyDao;

@Service
public class HobbyServiceImpl implements HobbyService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void create(HobbyDto dto) throws Exception {
		HobbyDao dao = sqlSession.getMapper(HobbyDao.class);
		dao.create(dto);
	}

	@Override
	public List<HobbyDto> read(String name) throws Exception {
		HobbyDao dao = sqlSession.getMapper(HobbyDao.class);
		List<HobbyDto> dtos = dao.read(name);
		return dtos;
	}

	@Override
	public void update(HobbyDto dto) throws Exception {
		HobbyDao dao = sqlSession.getMapper(HobbyDao.class);
		dao.update(dto);

	}

	@Override
	public void delete(String name) throws Exception {
		HobbyDao dao = sqlSession.getMapper(HobbyDao.class);
		dao.delete(name);

	}

	@Override
	public List<HobbyDto> list(String name) throws Exception {
		HobbyDao dao = sqlSession.getMapper(HobbyDao.class);
		List<HobbyDto> dtos = dao.list(name);
		return dtos;
	}

}
