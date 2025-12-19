package com.pilloud.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pilloud.model.PillVO;
import com.pilloud.service.PillService;
import com.pilloud.service.ShapeService;

@Controller
public class PillController {
	private static final Logger logger = LoggerFactory.getLogger(PillController.class);

	@Autowired
	private PillService pillService;
	
	// 의약품 검색리스트
    @ResponseBody
    @RequestMapping(value = "/searchPillNm", method = RequestMethod.POST, produces = "application/json")
    public List<PillVO> searchPillNm(@RequestBody PillVO searchVo) throws Exception {
        // 서비스를 호출하여 검색 결과를 가져옴
        List<PillVO> resultList = pillService.searchPillNm(searchVo);
        return resultList;
    }
}
