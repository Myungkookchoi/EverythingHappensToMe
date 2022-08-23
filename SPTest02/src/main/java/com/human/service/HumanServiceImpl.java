package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dto.HumanDto;
import com.human.dao.HumanDao;

@Service
public class HumanServiceImpl implements HumanService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void create(HumanDto dto) throws Exception {
		HumanDao dao = sqlSession.getMapper(HumanDao.class);
		dao.create(dto);

	}

	@Override
	public HumanDto read(String name) throws Exception {
		HumanDao dao = sqlSession.getMapper(HumanDao.class);
		HumanDto dto = dao.read(name);
		return dto;
	}

	@Override
	public void delete(String name) throws Exception {
		HumanDao dao = sqlSession.getMapper(HumanDao.class);
		dao.delete(name);
	}

	@Override
	public void update(HumanDto dto) throws Exception {
		HumanDao dao = sqlSession.getMapper(HumanDao.class);
		dao.update(dto);
	}

	@Override
	public List<HumanDto> list() throws Exception {
		HumanDao dao = sqlSession.getMapper(HumanDao.class);
		List<HumanDto> dtos = dao.list();
		return dtos;
	}

}
