package com.pilloud.mapper;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;

public interface PillMapper {

    /* 의약품 검색 리스트 */
	public List<PillVO> searchPillNm(PillVO searchVo) throws Exception;
    
}
