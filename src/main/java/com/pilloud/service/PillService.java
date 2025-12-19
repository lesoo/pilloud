package com.pilloud.service;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;
import com.pilloud.model.UserVO;

public interface PillService {

    /* 의약품 검색리스트 */
	public List<PillVO> searchPillNm(PillVO searchVo) throws Exception;
}
