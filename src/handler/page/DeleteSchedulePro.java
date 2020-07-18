package handler.page;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import controller.CommandHandler;
import dao.ScheduleDAO;
import dao.UserDAO;
import model.ScheduleVO;
import model.UserVO;

public class DeleteSchedulePro implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ScheduleDAO scheduleDAO = ScheduleDAO.getInstance();
		UserDAO userDAO = UserDAO.getInstance();
		String scheduleId = req.getParameter("id");
		String pkId = req.getParameter("memberId");
		
		ScheduleVO scheduleVO = scheduleDAO.selectScheduleInfoBySCHPK(Integer.parseInt(scheduleId));
		long dateDiff =((scheduleVO.getEndDate().getTime()-scheduleVO.getStartDate().getTime())/(24*60*60*1000));
		if(scheduleVO.getContent().equals("연차")) {
			userDAO.updateUserMonthHoliday_plus(pkId, dateDiff);
		}
		//type 관리자 구분용 
		String type = req.getParameter("type");
		if(type==null) type="1";
		scheduleDAO.deleteSchedule(Integer.parseInt(scheduleId));
		if(type.equals("2")) {
			return "/page/schedule";
		}else {
			return "/WEB-INF/views/calendar/deleteSuccessMessage.jsp";
		}
		}
}
