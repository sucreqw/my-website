package com.sucre.handler;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sucre.common.iJson;
import com.sucre.common.webUtils;
import com.sucre.entity.GenerationEntity;
import com.sucre.entity.UserEntity;
import com.sucre.function.UserFunction;
import com.sucre.function.impl.SinaLoging;

/**
 * 登录方法类
 * 
 * @author sucre
 *
 */
@Controller
public class loginHandler {
	/**
	 * 业务层的对象
	 */
	@Autowired
	UserFunction fun;

	/**
	 * 发布一条微博
	 * 
	 * @param data     微博内容
	 * @param picurl   图片地址
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/publish.do", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void publish(String data, String picurl, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");

		if (webUtils.isEmpty(data) || data.length() > 140) {
			response.getWriter().print(iJson.putData("非法参数!"));

		} else {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()) {
					response.getWriter().print(iJson.putData("账号异常!"));
					return;
				}
				fun.post(webUtils.trims(data), picurl, request);
				response.getWriter().print(iJson.putData("发布成功!"));
				return;
			}
			response.getWriter().print(iJson.putData("请先登录"));
		}

	}

	/**
	 * 管理员登录用
	 * 
	 * @param account
	 * @param password
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login.do")
	public String login(String account, String password, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		String ret = "非法参数!";
		if (!webUtils.isEmpty(account) || !webUtils.isEmpty(password)) {
			UserEntity u = fun.login(account, password);
			if (u != null) {
				Cookie cookie = new Cookie("cool", u.getCookie());
				cookie.setMaxAge(60 * 60 * 24 * 100);
				response.addCookie(cookie);
				// response.addHeader("Set-Cookie", "cool="+u.getCookie() +"; expires=Sun,
				// 29-Jul-2218 06:14:56 GMT; Max-Age=600; path=/; "); //domain=localhost;
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", u);
				session.setAttribute("page", "1");
				return "redirect:/manager.do?page=1&source=0";
			} else {
				ret = "账号或者密码错误!";
			}
		}

		request.setAttribute("message", ret);
		return "forward:/inside.jsp";
	}

	@RequestMapping("/manager.do")
	public String manager(String page, String source, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (webUtils.isEmpty(page) || webUtils.isEmpty(source)) {
			session.setAttribute("message", "非法参数!");
			return "error";
		}

		session.setAttribute("page", page);
		session.setAttribute("source", source);

		return "manager";
	}

	/**
	 * 取最新的微博
	 * 
	 * @param page
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/time_line.do")
	@ResponseBody
	public void getWeibo(String page, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		String data = fun.getpost(page);
		response.getWriter().println(iJson.putData(data));
	}

	/**
	 * 点赞
	 * 
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addlike.do")
	@ResponseBody
	public void addlike(String id, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		fun.addlike(id);
		response.getWriter().println(iJson.putData("success!"));
	}

	/**
	 * 无人机区点赞
	 * 
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adddronelike.do")
	@ResponseBody
	public void addDronelike(String id, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		fun.addDronelike(id);
		response.getWriter().println(iJson.putData("success!"));
	}

	/**
	 * 评论一条微博
	 * 
	 * @param content
	 * @param wid
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addcomment.do")
	@ResponseBody
	public void addcomment(String content, String wid, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");

		if (webUtils.isEmpty(content) || content.length() > 140) {
			response.getWriter().print(iJson.putData("非法参数!"));

		} else {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()) {
					response.getWriter().print(iJson.putData("账号异常!"));
					return;
				}

				fun.addcomment(content, wid, request);
				response.getWriter().print(iJson.putData("发布成功!"));
				return;
			}
			response.getWriter().print(iJson.putData("请先登录"));
		}
	}

	/**
	 * 取一面评论列表
	 * 
	 * @param page
	 * @param wid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getcomments.do")
	@ResponseBody
	public void getcomments(String page, String wid, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		String data = fun.getcomment(page, wid);
		response.getWriter().println(iJson.putData(data));
	}

	/**
	 * 上传图片
	 * 
	 * @param imageFile
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	// 接收上传上来的图片文件,参数一定要加注释,不然接收会为null.
	@ResponseBody
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public void upload(@RequestParam("pic1") MultipartFile imageFile, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");

		if (imageFile != null) {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()) {
					response.getWriter().print(iJson.putData("账号异常!"));
					return;
				}
				String realPath = request.getSession().getServletContext().getRealPath("");
				
				realPath=realPath.substring(0, realPath.lastIndexOf(File.separator, realPath.length()-2));
				File dir = new File(realPath + "/weiboimg");
				Date date = new Date();
				String fName = date.getTime() + ".jpg";
				File file = new File(dir, fName);
				System.out.println(file);
				imageFile.transferTo(file);

				response.getWriter().print(iJson.putData("发布成功!,filename:" + fName));
				return;
			}
			response.getWriter().print(iJson.putData("请先登录"));
		} else {

			response.getWriter().print(iJson.putData("文件无效"));
		}
	}

	/**
	 * 取无人机区作品列表
	 * 
	 * @param page
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getdrone.do")
	@ResponseBody
	public void getDrone(String page, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		String data = fun.getDrone(page);
		response.getWriter().println(iJson.putData(data));
	}

	/**
	 * 取无人机区评论列表
	 * 
	 * @param page
	 * @param mid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getdronecomment.do")
	@ResponseBody
	public void getDroneComment(String page, String mid, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		String data = fun.getDroneComment(page, mid);
		response.getWriter().println(iJson.putData(data));
	}

	/**
	 * 对无人机区作品评论
	 * 
	 * @param content
	 * @param mid
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adddronecomment.do")
	@ResponseBody
	public void addDroneComment(String content, String mid, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (webUtils.isEmpty(content) || content.length() > 140) {
			response.getWriter().print(iJson.putData("非法参数!"));

		} else {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()) {
					response.getWriter().print(iJson.putData("账号异常!"));
					return;
				}
				fun.addDroneComment(content, mid, request);
				response.getWriter().print(iJson.putData("发布成功!"));
				return;
			}
			response.getWriter().print(iJson.putData("请先登录"));
		}
	}

	/**
	 * 取族谱某一人的信息及其子女信息
	 * 
	 * @param id
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getgen.do")
	@ResponseBody
	public void getGen(String id, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(id)) {
			String data = fun.getGenInfo(id);
			response.getWriter().println(iJson.putData(data));
			return;
		}
		response.getWriter().println(iJson.putData("出错了!"));
	}

	/**
	 * 对某人添加父亲或者儿女
	 * 
	 * @param id       对此人添加父亲或者儿女
	 * @param nickname
	 * @param wife
	 * @param birthday
	 * @param details
	 * @param gender
	 * @param isfather
	 * @param avater
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addperson.do")
	@ResponseBody
	public void addPerson(String id, String nickname, String wife, String birthday, String details, String gender,
			String isfather, String avater, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");

		if (!webUtils.isEmpty(id) && !webUtils.isEmpty(nickname) && !webUtils.isEmpty(isfather)
				&& !(details.length() > 1024)) {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				String ret = "";
				setUser(request);
				if (u.isIsblock()) {
					response.getWriter().print(iJson.putData("账号异常!"));
					return;
				}
				// java7后switch允许string
				switch (isfather) {
				case "0":
					ret = fun.addFather(id, nickname, wife, gender, details, birthday, avater, u.getCookie());
					break;

				case "1":
					ret = fun.addSon(id, nickname, wife, gender, details, birthday, avater, u.getCookie());
					break;
				}
				response.getWriter().println(iJson.putData(ret));
				return;
			} else {
				response.getWriter().println(iJson.putData("请先登录!"));
				return;
			}
		}

		response.getWriter().println(iJson.putData("非法参数!"));
	}

	/**
	 * 取某一个人的详细信息
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/detail.do")
	public String details(String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (!webUtils.isEmpty(id)) {
			GenerationEntity gen = fun.details(id);
			if (gen != null) {
				HttpSession session = request.getSession();
				session.setAttribute("currentPerson", gen);
				return "detail";
			}

		}
		return "";
	}

	@RequestMapping("/search.do")
	@ResponseBody
	public void search(String nickname, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(nickname)) {
			response.getWriter().println(iJson.putData(fun.getSomeone(nickname)));
			return;
		}
		response.getWriter().println(iJson.putData("非法参数!"));
	}

	@RequestMapping("/getallfather.do")
	@ResponseBody
	public void getAllFather(String id, HttpServletResponse response) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(id)) {
			response.getWriter().println(iJson.putData(fun.getAllFather(id)));
			return;
		}
		response.getWriter().println(iJson.putData("非法参数!"));

	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public void delete(String id, String source, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(id) && !webUtils.isEmpty(source)) {
			
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()||!u.isIsmanager()) {
					response.getWriter().println(iJson.putData("账号异常!"));
					return;
				
				}else {
			fun.deleteAll(source, id);
			response.getWriter().println(iJson.putData("删除成功!"));
			return;
				}
			}
		}
		response.getWriter().println(iJson.putData("非法参数!"));
	}

	@RequestMapping("/insert.do")
	@ResponseBody
	public void insert(String data, String source, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(data) && !webUtils.isEmpty(source)) {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()||!u.isIsmanager()) {
					response.getWriter().println(iJson.putData("账号异常!"));
					return;
				
				}else {
			
			
			fun.insertAll(source, data);
			response.getWriter().println(iJson.putData("添加成功!"));
			return;
				}
			}
		}
		response.getWriter().println(iJson.putData("非法参数!"));
	}

	@RequestMapping("/updata.do")
	@ResponseBody
	public void updata(String data, String source, String id, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		if (!webUtils.isEmpty(data) && !webUtils.isEmpty(source) && !webUtils.isEmpty(id)) {
			UserEntity u = loginWithCookie(request);
			if (u != null) {
				setUser(request);
				if (u.isIsblock()||!u.isIsmanager()) {
					response.getWriter().println(iJson.putData("账号异常!"));
					return;
				
				}else {
			fun.updatAll(source, data, id);
			response.getWriter().println(iJson.putData("更新成功!"));
			return;
				}
			}
		}
		response.getWriter().println(iJson.putData("非法参数!"));
	}
	
	/**
	 * 微博登录回调
	 * @param code
	 * @param state
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/callback.do")
	
	public String callback(String code, String state,  HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.addHeader("Content-Type", "application/json;charset=UTF-8");
		    if(!webUtils.isEmpty(code)) {
		     SinaLoging sina=new SinaLoging();
		    
		     String cookie=sina.getToken(code,request);
		     if(!webUtils.isEmpty(cookie)) {
		    	 Cookie cookies = new Cookie("cool", cookie);
				 cookies.setMaxAge(60 * 60 * 24 * 100);
				 response.addCookie(cookies);
					return "forward:/index.jsp";
		     }
		    }
		return "error";
	}
	
	/**
	 * 用cookie登录,设置session
	 * 
	 * @param request
	 * @return
	 */
	private UserEntity loginWithCookie(HttpServletRequest request) {
		String Ccookie = webUtils.getCookie(request.getCookies(), "cool");
		if (webUtils.isEmpty(Ccookie)) {
			return null;
		}

		return fun.loginByCookie(Ccookie);
	}

	/**
	 * 用cookie登录,设置session
	 * 
	 * @param request
	 * @return
	 */
	private void setUser(HttpServletRequest request) {
		UserEntity u = loginWithCookie(request);
		HttpSession session = request.getSession();
		session.setAttribute("currentUser", u);

	}
}
