package dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.OvertimePriceVO;
import model.UserVO;

public class OvertimeDAO extends MybatisConnector {
	private final String namespace = "overtime";
	SqlSession sqlSession;

	private static OvertimeDAO instance = new OvertimeDAO();

	public static OvertimeDAO getInstance() {
		return instance;
	}
	
	public void insertOvertime(String[] targetIdList, OvertimePriceVO overtimeVO) {
		sqlSession = sqlSession();
		UserDAO userDao = UserDAO.getInstance();
		try {
			for(int i = 0; i< targetIdList.length ; i++) {
				//잘려진 taget list id기준으로 유저정보 
				UserVO targetVO = userDao.selectUserInfoByPK(Integer.parseInt(targetIdList[i]));
				overtimeVO.setTargetMbrId(targetIdList[i]);
				overtimeVO.setTargetMbrNm(targetVO.getMemberNm());
				sqlSession.insert(namespace + ".insertOvertime", overtimeVO);
			}
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public List<?> selectOvertimeInfoByPK(int Id) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Id", Id);
		try {
			return sqlSession.selectList(namespace + ".selectOvertimeInfoByPK", map);
		} finally {
			sqlSession.close();
		}
	}

}
