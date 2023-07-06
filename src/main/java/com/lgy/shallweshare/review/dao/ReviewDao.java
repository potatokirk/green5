package com.lgy.shallweshare.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.ReviewDto;

public interface ReviewDao {
public ArrayList<ReviewDto>list(HashMap<String, String>param);
public ArrayList<ReviewDto>listWithPaging(Criteria cri);
public void write(HashMap<String, String>param);
public ReviewDto contentView(HashMap<String, String>param);
public void modify (HashMap<String, String>param);
public void delete(HashMap<String, String> param);
public int getTotalCount();
public int idcheck(int id);
}
