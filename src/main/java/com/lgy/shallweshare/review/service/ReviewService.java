package com.lgy.shallweshare.review.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.ReviewDto;

public interface ReviewService {
	public ArrayList<ReviewDto>list();
	public ArrayList<ReviewDto>list(Criteria cri);

	public void write(HashMap<String, String>param);
	public ReviewDto contentView(HashMap<String, String>param);
	public void modify (HashMap<String, String>param);
	public void delete(HashMap<String, String> param);
	public int getTotalCount();
}
