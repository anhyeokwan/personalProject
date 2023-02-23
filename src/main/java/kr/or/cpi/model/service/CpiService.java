package kr.or.cpi.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cpi.model.dao.CpiDao;
import kr.or.cpi.model.vo.Cpi;

@Service
public class CpiService {

	@Autowired
	private CpiDao dao;

	public Cpi selectJiacen(HashMap<String, Object> params) {
		
		System.out.println("params_service : " + params);
		
		Cpi cpiOne = dao.selectOneJiacen(params);
		
		return cpiOne;
	}

	public int insertJiacen(HashMap<String, Object> params) {
		
		ArrayList<String> list = new ArrayList<String>();
		
		for(int i = 0; i < 5; i++) {
			list.add("0" + (i+1));
		}
		
		System.out.println("arr : " + list);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("statsYr", params.get("statsYr"));
		map.put("srvInstId", params.get("srvInstId"));
		System.out.println("지아센 1 : " + params.get("jiacen1"));
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i) == "01" && (int)params.get("jiacen1") != 0) {
				map.put("code", list.get(i));
				map.put("score", params.get("jiacen1"));
			}
			
			if(list.get(i) == "02" && (int)params.get("jiacen2") != 0) {
				map.put("code", list.get(i));
				map.put("score", params.get("jiacen2"));
			}
			
			if(list.get(i) == "03" && (int)params.get("jiacen3") != 0) {
				map.put("code", list.get(i));
				map.put("score", params.get("jiacen3"));
			}
			
			if(list.get(i) == "04" && (int)params.get("jiacen4") != 0) {
				map.put("code", list.get(i));
				map.put("score", params.get("jiacen4"));
			}
			
			if(list.get(i) == "05" && (int)params.get("jiacen5") != 0) {
				map.put("code", list.get(i));
				map.put("score", params.get("jiacen5"));
			}
			int result = dao.insertJiacen(map);
			
		}
		
		return 0;
	}
}





















