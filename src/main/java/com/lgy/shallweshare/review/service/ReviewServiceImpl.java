package com.lgy.shallweshare.review.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.review.dao.ReviewDao;
import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.ReviewDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<ReviewDto> list(Criteria cri) {
		log.info("@# ReviewServiceImpl.list(Criteria cri) start");
		log.info("@# cri ===>" + cri);

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		int total = dao.getTotalCount();
		log.info("@# total ===>" + total);

		log.info("@# BServiceImpl.list(Criteria cri) end");

		return dao.listWithPaging(cri);
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# ReviewServiceImpl.write() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.write(param);
		log.info("@# ReviewServiceImpl.write() end");

	}

	@Override
	public ReviewDto contentView(HashMap<String, String> param) {
		log.info("@# ReviewServiceImpl.contentView() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ReviewDto dto = dao.contentView(param);
		log.info("@# ReviewServiceImpl.contentView() end");
		return dto;
	}

	@Override
	public int getTotalCount() {
		log.info("@# BServiceImpl.getTotalCount()");

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		return dao.getTotalCount();
	}

	@Override
	public ArrayList<ReviewDto> list() {

		return null;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(HashMap<String, String> param) {
		// TODO Auto-generated method stub

	}

}
