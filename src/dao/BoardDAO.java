package dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.ScheduleVO;
import model.UserVO;

public class BoardDAO extends MybatisConnector {
	private final String namespace = "board";
	SqlSession sqlSession;

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	//selectBoardCount
	
	public int selectBoardCount() {
		int boardAllCount = 0;
		sqlSession = sqlSession();
		boardAllCount = sqlSession.selectOne(namespace + ".selectBoardCount");
		sqlSession.close();
		return boardAllCount;
	}
	
	public List<ScheduleVO> selectBoardList(int startRow, int endRow) {
		sqlSession = sqlSession();
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);  
		try {
			return sqlSession.selectList(namespace + ".selectBoardList", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public void insertSchedule(ScheduleVO schedule) {
		sqlSession = sqlSession();
		try {
			sqlSession.insert(namespace + ".insertSchedule", schedule);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	public void insertScheduleALL(List<?> members, String dutyId, Date transStartDate, Date transEndDate,
			String content,String startWorkTime,String endWorkTime) {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("dutyId", dutyId); 
		map.put("transStartDate", transStartDate);
		map.put("transEndDate", transEndDate);
		map.put("content", content);
		map.put("startWorkTime", startWorkTime);
		map.put("endWorkTime", endWorkTime);
		try {
			for(int i=0;i<members.size();i++) {
				UserVO userVO= (UserVO)members.get(i);
				map.put("memberId", userVO.getId());
				sqlSession.insert(namespace + ".insertScheduleALL", map);
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}
	public List<?> selectScheduleInfo(String memberId) {
		sqlSession = sqlSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		try {
			return sqlSession.selectList(namespace + ".selectScheduleInfo", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<?>  selectScheduleInfoByPK(int Id) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("Id", Id);
		try {
			return sqlSession.selectList(namespace + ".selectScheduleInfoByPK", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public ScheduleVO selectScheduleInfoBySCHPK(int scheduleId) {
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("scheduleId", scheduleId);
		try {
			return sqlSession.selectOne(namespace + ".selectScheduleInfoBySCHPK", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public void deleteSchedule(int scheduleId) {
		
		sqlSession = sqlSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("scheduleId", scheduleId);
		try {
			sqlSession.delete(namespace + ".deleteSchedule", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
		
		
	}
	
	public void updateSchedule(ScheduleVO scheduleVO) {
		sqlSession = sqlSession();
		try {
			sqlSession.update(namespace + ".updateSchedule", scheduleVO);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
	}
	
	public void updateScheduleDuty(ScheduleVO scheduleVO) {
		sqlSession = sqlSession();
		try {
			sqlSession.update(namespace + ".updateScheduleDuty", scheduleVO);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		
	}
	

}