package com.nguyentuan.controller;

import java.lang.reflect.Method;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nguyentuan.Exprot.ExcelUserListReportView;
import com.nguyentuan.Exprot.ItextPdfView;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.LeavetypeEntity;
import com.nguyentuan.entity.RolesEntity;
import com.nguyentuan.entity.UserEntity;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.entity.UserTimeOut;
import com.nguyentuan.entity.UserfcRolesEntity;
import com.nguyentuan.serverImpl.DepartmentServerImpl;
import com.nguyentuan.serverImpl.LeaveServerImpl;
import com.nguyentuan.serverImpl.RolesServerImpl;
import com.nguyentuan.serverImpl.UserFcRolesServerImpl;
import com.nguyentuan.serverImpl.UserRolesServerImpl;
import com.nguyentuan.serverImpl.UserServerIpml;
import com.nguyentuan.serverImpl.UserTimeOutServerImpl;
import com.nguyentuan.serverlogic.DepartmentServer;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	String Url = "";
	@Autowired
	UserServerIpml userServerIpml;
	@Autowired
	DepartmentServerImpl departmentServerImpl;
	@Autowired
	RolesServerImpl rolesserverImpl;
	@Autowired
	UserRolesServerImpl userRolesServerImpl;
	@Autowired
	LeaveServerImpl leaveServerImpl;
	@Autowired
	UserTimeOutServerImpl userTimeOutServerImpl;

	@Autowired
	UserFcRolesServerImpl checkUserRolessss ;

	@RequestMapping(value = "/login")
	public String index(ModelMap modelMap) {
		modelMap.put("user", new UserEntity());
		return "login";
	}

	// Check login
	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String checklogin(ModelMap modelMap, @ModelAttribute(value = "user") @Valid UserEntity entity,
			BindingResult bindingResult, HttpSession httpSession, HttpServletRequest request) {
		if (bindingResult.hasErrors()) {
			return "login";
		}
		if (userServerIpml.login(entity.getUserName(), entity.getPassword()).size() > 0) {
			httpSession = request.getSession();
			List<UserEntity> userentity = new ArrayList<>();
			userentity = userServerIpml.login(entity.getUserName(), entity.getPassword());
			httpSession.setAttribute("udername", userentity);
			Url = "index";
		} else {
			Url = "409";
		}
		return Url;
	}

	// time in
	@RequestMapping(value = "/timein", method = RequestMethod.GET)
	public String addtimein1(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {

		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		modelMap.put("newtimein", new UserTimeOut());
		modelMap.put("leaveServerImplList", leaveServerImpl.findAll());
		modelMap.put("user", userEntity);
		return "TimeIn";
	}

	@RequestMapping(value = "/addtimein1", method = RequestMethod.POST)
	public String abc(ModelMap modelMap, @ModelAttribute(value = "newtimein") @Valid UserTimeOut timeOut,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {

			Url = "409";
		} else {
			userTimeOutServerImpl.saveAddTimeOut(timeOut);
			Url = "redirect:/home/index";
		}
		return Url;
	}

	// Time Out
	@RequestMapping(value = "/timeout", method = RequestMethod.GET)
	public String timeout(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		modelMap.put("timeout", new UserTimeOut());
		modelMap.put("leaveServerImplList", leaveServerImpl.findAll());
		modelMap.put("user", userEntity);
		return "TimeOut";

	}

	@RequestMapping(value = "/addtimeout", method = RequestMethod.POST)
	public String addtimeout(@ModelAttribute(value = "timeout") @Valid UserTimeOut timeOut,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			Url = "409";
		} else {
			userTimeOutServerImpl.saveAddTimeOut(timeOut);
			Url = "redirect:/home/index";
		}
		return Url;

	}

	// show user time in or time out offdate

	@RequestMapping(value = "/showUserTimeInOut", method = RequestMethod.GET)
	public String showUserTimeInOut(ModelMap timeOut) {
		timeOut.put("userTimeOutServerImpl", userTimeOutServerImpl.findAll());
		return "showUserTimeinOut";

	}

	// DayOff
	@RequestMapping(value = "/regithdayoff")
	public String regithdayoff(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		modelMap.put("user", userEntity);
		modelMap.put("timeout", new UserTimeOut());
		modelMap.put("leaveServerImplList", leaveServerImpl.findAll());

		return "regithdayoff";
	}

	@RequestMapping(value = "/addregithdayoff", method = RequestMethod.POST)
	public String addregithdayoff(@ModelAttribute(value = "timeout") @Valid UserTimeOut timeOut,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			Url = "409";
		} else {
			userTimeOutServerImpl.saveAddTimeOut(timeOut);
			Url = "redirect:/home/index";
		}

		return Url;
	}

	// userRoles
	@RequestMapping(value = "/userroles")
	public String userroles(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {

			modelMap.put("Userroles", new UserfcRolesEntity());
			modelMap.put("user", userServerIpml.findAll());
			modelMap.put("roleslist", rolesserverImpl.findAll());
			modelMap.put("listUserRoles", checkUserRolessss.findAll());
			URL = "userroles";
		} else {
			URL = "404";
		}
		return URL;
	}

	@RequestMapping(value = "/addUserRoles")
	public String addUserRoles(@ModelAttribute(value = "Userroles") UserfcRolesEntity userRolesEntity,
			HttpSession httpSession, HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			DepartmentEntity departmentEntity = new DepartmentEntity();
			departmentEntity.setID(7);
			userRolesEntity.setDeptID(departmentEntity);
			checkUserRolessss.save(userRolesEntity);
			URL = "redirect:/home/userroles";
		} else {
			URL = "404";
		}
		return URL;

	}

	@RequestMapping(value = "/editUserRoles/{id}", method = RequestMethod.GET)
	public String editUserRoles(ModelMap modelMap, @PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			modelMap.put("editUserRoles", checkUserRolessss.findById(Integer.parseInt(id)));
			modelMap.put("Userroles", new UserfcRolesEntity());
			modelMap.put("roleslist", rolesserverImpl.findAll());
			URL = "editUserRoles";
		} else {
			URL = "404";
		}
		return URL;

	}

	@RequestMapping(value = "/updateUserRoles", method = RequestMethod.POST)
	public String updateUserRoles(@ModelAttribute(value = "Userroles") UserfcRolesEntity rolesEntity) {
		DepartmentEntity departmentEntity = new DepartmentEntity();
		departmentEntity.setID(7);
		rolesEntity.setDeptID(departmentEntity);
		checkUserRolessss.update(rolesEntity);
		return "redirect:/home/userroles";
	}

	@RequestMapping(value = "/delectUserRoles/{id}")
	public String delectUserRoles(@PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			checkUserRolessss.delete(Integer.parseInt(id));
			URL = "redirect:/home/userroles";
		} else {
			URL = "404";
		}
		return URL;

	}

	// UserFcROles

	// show Fcroles showCustomer
	@RequestMapping(value = "/showCustomer/{id}", method = RequestMethod.GET)
	public String showCustomer(ModelMap modelMap, @PathVariable(value = "id") String id) {
		modelMap.put("showFcroles", userRolesServerImpl.findIdUserRoles(Integer.parseInt(id)));

		modelMap.put("addrole", new UserfcRolesEntity());

		return "showFcroles";
	}

	// Department ----------------
	@RequestMapping(value = "/department", method = RequestMethod.GET)
	public String department(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			modelMap.put("Department1", new DepartmentEntity());
			modelMap.put("departmentshow", departmentServerImpl.listDepartmentEntity());
			URL = "Department";
		} else {
			URL = "404";
		}
		return URL;

	}

	@RequestMapping(value = "/adddepartment", method = RequestMethod.POST)
	public String adddepartment(ModelMap modelMap,
			@ModelAttribute(value = "Department1") @Valid DepartmentEntity departmentEntity,
			BindingResult bindingResult, HttpSession httpSession, HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();

		if (bindingResult.hasErrors()) {
			return "404";
		} else {

			List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
			if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
				modelMap.put("Department1", new DepartmentEntity());
				departmentServerImpl.save(departmentEntity);
				URL = "redirect:/home/department";
			} else {
				URL = "404";
			}

		}

		return URL;

	}

	@RequestMapping(value = "/deleteDept/{id}", method = RequestMethod.GET)
	public String deleteDept(@PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			departmentServerImpl.delete(Integer.parseInt(id));
			URL = "redirect:/home/department";
		} else {
			URL = "404";
		}
		return URL;
	}

	@RequestMapping(value = "/editdept/{id}", method = RequestMethod.GET)
	public String editdept(@PathVariable(value = "id") String id, ModelMap modelMap, HttpSession httpSession,
			HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			modelMap.put("Department1", new DepartmentEntity());
			modelMap.put("edit", departmentServerImpl.findById(Integer.parseInt(id)));
			modelMap.put("departmentshow", departmentServerImpl.listDepartmentEntity());
			URL = "Department2";
		} else {
			URL = "404";
		}

		return URL;

	}

	@RequestMapping(value = "/updatedept", method = RequestMethod.POST)

	public String updatedept(@ModelAttribute(value = "Department1") DepartmentEntity departmentEntity) {
		departmentServerImpl.update(departmentEntity);
		return "redirect:/home/department";
	}

	// Roles ---------------------------------------
	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public String roles(ModelMap modelMap, HttpSession httpSession, HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			modelMap.put("addrole", new RolesEntity());
			modelMap.put("roleslist", rolesserverImpl.findAll());
			URL = "Roles";
		} else {
			URL = "404";
		}

		return URL;

	}

	@RequestMapping(value = "/addroles", method = RequestMethod.POST)
	public String addroles(ModelMap modelMap, @ModelAttribute(value = "addrole") @Valid RolesEntity rolesEntity,
			BindingResult bindingResult, HttpSession httpSession, HttpServletRequest request) {

		String URL = "";

		if (bindingResult.hasErrors()) {
			return "404";
		} else {

			HttpSession session = request.getSession();
			List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

			if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
				rolesserverImpl.save(rolesEntity);
				URL = "redirect:/home/roles";
			} else {
				URL = "404";
			}
		}

		return URL;

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") String id, HttpSession httpSession, HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			rolesserverImpl.delete(Integer.parseInt(id));
			URL = "redirect:/home/roles";
		} else {
			URL = "404";
		}

		return URL;

	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap modelMap, @PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 7) == true) {
			modelMap.put("addrole", new RolesEntity());
			modelMap.put("roleslist", rolesserverImpl.findAll());
			modelMap.put("edit", rolesserverImpl.findById(Integer.parseInt(id)));
			URL = "Roles2";
		} else {
			URL = "404";
		}

		return URL;

	}

	@RequestMapping(value = "/updateroles", method = RequestMethod.POST)
	public String updateroles(@ModelAttribute(value = "addrole") RolesEntity rolesEntity) {
		rolesserverImpl.update(rolesEntity);
		return "redirect:/home/roles";
	}
	// time out

	@RequestMapping(value = "/usertimeout", method = RequestMethod.GET)
	public String hienthi(ModelMap map, HttpSession httpSession, HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 8) == true) {
			map.put("userTimeOutServerImpl", userTimeOutServerImpl.findAll());
			URL = "usertimeout";
		} else {
			URL = "404";
		}

		return URL;
	}

	@RequestMapping(value = "/viewdialogtimeout/{id}", method = RequestMethod.GET)
	public String viewdialogtimeout(ModelMap map, @PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {
		map.put("userTimeOutServerImpl", userTimeOutServerImpl.findById(Integer.parseInt(id)));
		return "dialogTimeout";

	}

	@RequestMapping(value = "/cannertimeout/{id}", method = RequestMethod.GET)
	public String cannertimeout(ModelMap map, @PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 8) == true) {
			map.put("userTimeOutServerImpl", userTimeOutServerImpl.findById(Integer.parseInt(id)));
			map.put("usertimeout", new UserTimeOut());

			URL = "dialogCanneltimeout";
		} else {
			URL = "404";
		}
		return URL;
	}

	@RequestMapping(value = "/updateManagertimeout", method = RequestMethod.POST)
	public String updateManagertimeout(@ModelAttribute(value = "usertimeout") UserTimeOut userTimeOut) {
		userTimeOutServerImpl.UpdateManagertimeout(userTimeOut);
		return "redirect:/home/usertimeout";
	}

	@RequestMapping(value = "/updateYesManagertimeout/{id}")
	public String updateYesManagertimeout(@PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {
		UserTimeOut timeOut = new UserTimeOut();
		timeOut.setID(Integer.parseInt(id));
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 8) == true) {
			timeOut.setManagerApproval(userEntity.get(0));
			userTimeOutServerImpl.UpdateManagertimeout(timeOut);
			URL = "redirect:/home/usertimeout";
		} else {
			URL = "404";
		}
		return URL;
	}

	// userDirectorApprovalTimeOut
	@RequestMapping(value = "/userDirectorApprovalTimeOut", method = RequestMethod.GET)
	public String userDirectorApprovalTimeOut(ModelMap map, HttpSession httpSession, HttpServletRequest request) {

		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");

		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 1) == true) {
			map.put("userTimeOutServerImpl", userTimeOutServerImpl.findAll());
			URL = "usertimeout5";
		} else {
			URL = "404";
		}
		return URL;
	}

	@RequestMapping(value = "/cannelDirectorApprovaltimeout/{id}", method = RequestMethod.GET)
	public String cannelDirectorApprovaltimeout(ModelMap map, @PathVariable(value = "id") String id,
			HttpSession httpSession, HttpServletRequest request) {
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 1) == true) {
			map.put("userTimeOutServerImpl", userTimeOutServerImpl.findById(Integer.parseInt(id)));
			map.put("usertimeout", new UserTimeOut());
			URL = "dialogDireCanneltimeout2";
		} else {
			URL = "404";
		}
		return URL;
	}

	@RequestMapping(value = "/updateDirectorApprovaltimeout", method = RequestMethod.POST)
	public String updateDirectorApprovaltimeout(@ModelAttribute(value = "usertimeout") UserTimeOut userTimeOut) {
		userTimeOutServerImpl.UpdateDirectorApprovaltimeout(userTimeOut);
		return "redirect:/home/userDirectorApprovalTimeOut";
	}

	@RequestMapping(value = "/updateYesDirectorApprovaltimeout/{id}")
	public String updateYesDirectorApprovaltimeout(@PathVariable(value = "id") String id, HttpSession httpSession,
			HttpServletRequest request) {
		UserTimeOut timeOut = new UserTimeOut();
		timeOut.setID(Integer.parseInt(id));
		String URL = "";
		HttpSession session = request.getSession();
		List<UserEntity> userEntity = (List<UserEntity>) session.getAttribute("udername");
		if (checkUserRolessss.checkUserRolesManager(userEntity.get(0).getID(), 1) == true) {
			timeOut.setDirectorApproval(userEntity.get(0));
			userTimeOutServerImpl.UpdateDirectorApprovaltimeout(timeOut);

			URL = "redirect:/home/userDirectorApprovalTimeOut";
		} else {
			URL = "404";
		}
		return URL;

	}

	////////// Not 403 //
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();
		if (user != null) {
			model.addObject("msg", "Hi " + user.getName() + ", You can not access this page!");
		} else {
			model.addObject("msg", "You can not access this page!");
		}

		model.setViewName("403");
		return model;
	}

	// index
	@RequestMapping("/index")
	public String hello() {

		return "index";
	}

	@RequestMapping(value = "/Exprot", method = RequestMethod.GET)
	public ModelAndView userListReport(HttpServletRequest req, HttpServletResponse res) {

		String typeReport = req.getParameter("type");
		List<UserTimeOut> list = new ArrayList<UserTimeOut>();
		list = userTimeOutServerImpl.findAll();
		System.out.println(typeReport);

		if (typeReport != null && typeReport.equals("xls")) {
			return new ModelAndView(new ExcelUserListReportView(), "UserTimeOutList", list);

		} else if (typeReport != null && typeReport.equals("pdf")) {

			return new ModelAndView(new ItextPdfView(), "UserTimeOutList", list);

		}

		Url = "redirect:/home/showUserTimeInOut";
		return new ModelAndView("showUserTimeinOut", "userTimeOutServerImpl", list);

	}

}
