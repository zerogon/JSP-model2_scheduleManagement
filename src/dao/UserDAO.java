package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.ScheduleVO;
import model.UserVO;

public class UserDAO extends MybatisConnector {
	private final String namespace = "user";
	SqlSession sqlSession;

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}
	public int selectUserCount() {
		int userAllCount = 0;
		sqlSession = sqlSession();
		userAllCount = sqlSession.selectOne(namespace + ".selectUserCount");
		sqlSession.close();
		return userAllCount;
	}
	
	public List<ScheduleVO> selectUserList(int startRow, int endRow) {
		sqlSession = sqlSession();
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);  
		try {
			return sqlSession.selectList(namespace + ".selectUserList", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<UserVO> selectUserAllInfoByDpt(int dptNo) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("dptNo", dptNo);
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoByDpt",map);
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoByGrade() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoByGrade");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoMD() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoMD");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoPOS() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoPOS");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoMKT() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoMKT");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoSPT() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoSPT");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoINF() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoINF");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoGFT() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoGFT");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfoFIN() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfoFIN");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfo() {
		sqlSession = sqlSession();
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfo");
		} finally {
			sqlSession.close();
		}
	}
	public List<UserVO> selectUserAllInfobyDptNo(int dptNo) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("dptNo", dptNo);
		try {
			return sqlSession.selectList(namespace + ".selectUserAllInfobyDptNo",map);
		} finally {
			sqlSession.close();
		}
	}
	
	public UserVO selectUserInfo(String memberId) {
		sqlSession = sqlSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		try {
			return sqlSession.selectOne(namespace + ".selectUserInfo", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public UserVO selectUserInfoByPK(int Id) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Id", Id);
		try {
			return sqlSession.selectOne(namespace + ".selectUserInfoByPK", map);
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserInfo(UserVO userVO) {
		sqlSession = sqlSession();
		try {
			sqlSession.update(namespace + ".updateUserInfo", userVO);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserLikedDpr(String userId, String departure) {
		sqlSession = sqlSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Id", userId);
		map.put("departure", departure);
		try {
			sqlSession.update(namespace + ".updateUserLikedDpr", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserLikedDest(String userId, String destination) {
		sqlSession = sqlSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("Id", userId);
		map.put("destination", destination);
		try {
			sqlSession.update(namespace + ".updateUserLikedDest", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserMonthHoliday(String pkId, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", pkId);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserMonthHoliday", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public void updateUserMonthHoliday_plus(String pkId, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", pkId);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserMonthHoliday_plus", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserAlterHoliday_plus(String pkId, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", pkId);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserAlterHoliday_plus", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserAlterHoliday(String memberPKID, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", memberPKID);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserAlterHoliday", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserHoliday(String memberPKID, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", memberPKID);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserHoliday", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void updateUserHoliday_plus(String pkId, float dateDiff) {
		sqlSession = sqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Id", pkId);
		map.put("dateDiff", dateDiff);
		try {
			sqlSession.update(namespace + ".updateUserHoliday_plus", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
}
