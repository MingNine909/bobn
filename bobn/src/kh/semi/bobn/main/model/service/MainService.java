package kh.semi.bobn.main.model.service;

import static kh.semi.bobn.common.jdbc.JdbcDBCP.close;
import static kh.semi.bobn.common.jdbc.JdbcDBCP.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.bobn.main.model.dao.MainDao;
import kh.semi.bobn.main.model.vo.MainVo;

public class MainService {

	// best shopping 목록
	public ArrayList<MainVo> bslist(){
		Connection conn = getConnection();
		ArrayList<MainVo> bslist = new MainDao().bslist(conn);
		System.out.println("bslist service" + bslist); //확인용 코드 
		close(conn);
		return bslist;
	}
}
