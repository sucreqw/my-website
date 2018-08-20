package com.sucre.function.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sucre.common.webUtils;
import com.sucre.dao.UserDao;
import com.sucre.entity.DroneCommentEntity;
import com.sucre.entity.DroneEntity;
import com.sucre.entity.GenerationEntity;
import com.sucre.entity.SonEntity;
import com.sucre.entity.UserEntity;
import com.sucre.entity.commentEntity;
import com.sucre.entity.weiboEntity;
import com.sucre.function.UserFunction;

/**
 * 业务层的类,用来userfunction 的接口方法
 * 
 * @author sucre
 *
 */
//加注释表示这是个业务层的类
@Service
public class UserFunctionImpl implements UserFunction {
	@Autowired
	UserDao udao;

	// 登录的参数判断.
	public UserEntity login(String account, String password) {
		if (!webUtils.isEmpty(account) && !webUtils.isEmpty(password)) {
			UserEntity u = udao.selectByAccount(account);
			if (u != null && u.getPsd().equals(password)) {
				return u;
			}
		}
		return null;
	}

	// 用cookie来取user对象.解决十五分钟session就过期的问题!
	public UserEntity loginByCookie(String cookie) {

		if (!webUtils.isEmpty(cookie)) {
			UserEntity u = udao.selectByCookie(cookie);
			if (u != null) {
				return u;
			}
		}
		return null;
	}
    
	/**
	 * 发一条微博
	 */
	@Override
	public void post(String content, String picurl, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserEntity u = (UserEntity) session.getAttribute("currentUser");

		String token = u.getToken();
		String nickname = u.getNickname();
		String avater = u.getAvater();
		Date postday = new Date();
		String postip = request.getRemoteAddr();// 获取客户端的ip

		udao.addpost(token, postday, postip,"0", nickname, avater, content, picurl);
	}
    
	/**
	 * 取一页微博
	 */
	@Override
	public String getpost(String page) {
		List<weiboEntity> weibo = udao.getweibo(webUtils.pageLow(page), webUtils.pageUp(page));
		return webUtils.getEntity(weibo);
	}
    
	/**
	 * 点赞
	 */
	@Override
	public void addlike(String id) {
		udao.addlike(id);
	}
    
	/**
	 * 发布一条评论
	 */
	@Override
	public void addcomment(String content, String wid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserEntity u = (UserEntity) session.getAttribute("currentUser");

		String token = u.getToken();
		String nickname = u.getNickname();
		String avater = u.getAvater();
		Date postday = new Date();
		String postip = request.getRemoteAddr();// 获取客户端的ip

		udao.addcomment(postip, postday, nickname, token, avater, content, wid);
	}
    
	/**
	 * 取一页评论列表 
	 */
	@Override
	public String getcomment(String page, String wid) {
		List<commentEntity> weibo = udao.getcomments(webUtils.pageLow(page), webUtils.pageUp(page), wid);
		return webUtils.getEntity(weibo);
	}
    
	/**
	 * 取一页无人机作品
	 */
	@Override
	public String getDrone(String page) {
		List<DroneEntity> drone = udao.getdrones(webUtils.pageLow(page), webUtils.pageUp(page));

		return webUtils.getEntity(drone);
	}
    
	/**
	 * 无人机作品点赞
	 */
	@Override
	public void addDronelike(String id) {
		udao.addDroneLike(id);
	}
    
	/**
	 * 无人机作品发布评论
	 */
	@Override
	public void addDroneComment(String content, String mid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserEntity u = (UserEntity) session.getAttribute("currentUser");

		String token = u.getToken();
		String nickname = u.getNickname();
		String avater = u.getAvater();
		Date postday = new Date();
		String postip = request.getRemoteAddr();// 获取客户端的ip
		udao.addDroneComment(mid, token, avater, nickname, content, postip, postday);
	}
    
	/**
	 * 取无人机作品评论列表
	 */
	@Override
	public String getDroneComment(String page, String mid) {
		List<DroneCommentEntity> dronecomment = udao.getDroneComment(webUtils.pageLow(page), webUtils.pageUp(page),
				mid);
		return webUtils.getEntity(dronecomment);
	}
    
	/**
	 * 取族谱某一个人的信息和此人儿子的信息
	 */
	@Override
	public String getGenInfo(String id) {
		GenerationEntity genInfo;
		if ("1".equals(id)) {

			genInfo = udao.getFirst(id);
		} else {

			genInfo = udao.getGenInfo(id);
		}

		if (genInfo != null) {
			String sons = genInfo.getSons();
			String[] l = sons.split("\\|");

			for (int i = 0; i < l.length; i++) {
				SonEntity temp = udao.getSon(l[i]);
				if (temp != null) {
					String sonname = genInfo.getSonsName();
					String sonswife = genInfo.getSonsWife();
					if (sonname == null) {
						sonname = "";
					}
					if (sonswife == null) {
						sonswife = "";
					}
					sonname += temp.getNickname();
					sonswife += temp.getWife();
					if (i < l.length - 1) {
						genInfo.setSonsName(sonname + "|");
						genInfo.setSonsWife(sonswife + "|");

					} else {
						genInfo.setSonsName(sonname);
						genInfo.setSonsWife(sonswife);

					}
				}
			}
			return genInfo.toString();

		}
		return "";
	}
    
	/**
	 * 为某一个人添加父亲的信息
	 */
	@Override
	public String addFather(String id, String nickname, String wife, String gender, String details, String birthday,
			String avater,String cookie) {
		GenerationEntity genInfo;
		
		//先取到要添加人的对象,然后查看是否已经存在此人的父亲的信息
		genInfo = udao.getFirst(id);
		if(genInfo!=null) {
		if(!(genInfo.getFather()==0)) {return"父亲信息已存在,不可重复提交!";}
		
		
		
		//信息不存在 ,可以添加数据
		GenerationEntity newGenInfo=new GenerationEntity();
		newGenInfo.setAvater(avater);
		newGenInfo.setBirthday(birthday);
		newGenInfo.setDetails(details);
		newGenInfo.setFather(0);
		newGenInfo.setGeneration(genInfo.getGeneration()-1);
		newGenInfo.setGender(Integer.parseInt(gender));
		newGenInfo.setNickname(nickname);
		newGenInfo.setWife(wife);
		newGenInfo.setSons(id);
		newGenInfo.setCookie(cookie);
		//udao.addperson(nickname, wife, gender, "0", id, details, String.valueOf((genInfo.getGeneration()-1)), birthday, avater);
		udao.addperson(newGenInfo);
		//添加完父亲的个人数据,更新自己父亲列的数据
		udao.updataInfo(String.valueOf(newGenInfo.getId()), genInfo.getSons(), id);
		return "添加成功!";
		}
		return "添加失败";
		
	}
    
	/**
	 * 为某一个人添加子女的信息
	 */
	@Override
	public String addSon(String id, String nickname, String wife, String gender, String details, String birthday,
			String avater,String cookie) {
        GenerationEntity genInfo;
		
		//先取到要添加人的对象,然后查看此人所有的儿子名字,检查是否已经被添加过了,防止多次提交!
		genInfo = udao.getFirst(id);
		
		if (genInfo != null) {
			//取出此人所有的儿子id
			String sons = genInfo.getSons();
			String[] l = sons.split("\\|");

			for (int i = 0; i < l.length; i++) {
				//取儿子id的姓名
				SonEntity temp = udao.getSon(l[i]);
				if (temp != null && nickname.equals(temp.getNickname())) {
					return"此儿女信息已存在,不可重复提交!";
				}
			}
			
		//添加儿女的个人数据
			//信息不存在 ,可以添加数据
			GenerationEntity newGenInfo=new GenerationEntity();
			newGenInfo.setAvater(avater);
			newGenInfo.setBirthday(birthday);
			newGenInfo.setDetails(details);
			newGenInfo.setFather(Integer.parseInt(id));
			newGenInfo.setGeneration(genInfo.getGeneration()+1);
			newGenInfo.setGender(Integer.parseInt(gender));
			newGenInfo.setNickname(nickname);
			newGenInfo.setWife(wife);
			newGenInfo.setSons("");
			newGenInfo.setCookie(cookie);
			//udao.addperson(nickname, wife, gender, "0", id, details, String.valueOf((genInfo.getGeneration()-1)), birthday, avater);
			udao.addperson(newGenInfo);
		//添加完成后,更新儿女列的数据!	
			String temp=genInfo.getSons();
			if(!webUtils.isEmpty(temp)) { temp = temp + "|" + newGenInfo.getId(); }else {temp= String.valueOf(newGenInfo.getId());}
			udao.updataInfo(String.valueOf(genInfo.getFather()),temp, id);
			return "添加成功!";
		}
		
		
		
	   return "添加失败";
	
	}
    /**
     * 取一个人的详细信息
     */
	@Override
	public GenerationEntity details(String id) {
      	return udao.getFirst(id);
	}
    
	/**
	 * 模糊搜索 一个人
	 * 
	 */
	@Override
	public String getSomeone(String nickname) {
		List<SonEntity> someone=udao.getSomeone(nickname);
		return webUtils.getEntity(someone);
	}

	@Override
	public String getAllFather(String id) {
		String ret="";
		GenerationEntity genInfo;
		while(true) {
			
			genInfo=udao.getFirst(id);
			if(genInfo!=null) {
				id=String.valueOf(genInfo.getFather());
				
				if(id=="0") {
					    return ret;
					}else {
						ret= id + "|" + ret;
					}
				
			}else {
				return ret;
			}
			
		}
		
	}
    
	
	/**
	 * 取指定数据库的信息.传入前先判断是否为空
	 */
	@Override
	public List<?> getAll(String source, String page) {
		//{"user","weibo","comments","drone","dronecommant","generation"};
		//List<DroneCommentEntity> dronecomment = udao.getDroneComment(webUtils.pageLow(page), webUtils.pageUp(page),mid);
	 List<?> target=null;
		switch(source) {
		//user表
		case("0"):
			target = udao.selectUser(webUtils.pageLow(page), webUtils.pageUp(page));
		    break;
		
		//weibo 
		case("1"):
			target = udao.selectWeibo(webUtils.pageLow(page), webUtils.pageUp(page));
			break;
		
		//comments
		case("2"):
			target = udao.selectComment(webUtils.pageLow(page), webUtils.pageUp(page));
			break;
		
		//drone
		case("3"):
			target = udao.selectDrone(webUtils.pageLow(page), webUtils.pageUp(page));
			break;
		
		//dronecommant
		case("4"):
			target = udao.selectDroneComment(webUtils.pageLow(page), webUtils.pageUp(page));
			break;
		
		//generation
		case("5"):
			target = udao.selectGeneration(webUtils.pageLow(page), webUtils.pageUp(page));
			break;
		
		}
	   return target;
	}

	@Override
	public void insertAll(String source, String data) {
		switch(source) {
		
		case("3"):
			String[] s=webUtils.splitData(data);
			udao.addDrone(s[0], s[1],s[2], s[3]);
			break;
		
		}
	}
    
	@Override
	public void updatAll(String source, String data, String id) {
		String[] s;
		switch(source) {
		//user表
		case("0"):
			s=webUtils.splitData(data);
			udao.updataUser(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s),webUtils.getIndex(5, s),webUtils.getIndex(6, s),webUtils.getIndex(7, s),webUtils.getIndex(8, s),webUtils.getIndex(9, s),webUtils.getIndex(10, s),webUtils.getIndex(11, s));
			break;
		
		//weibo 
		case("1"):
			s=webUtils.splitData(data);
		    udao.updataWeibo(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s),webUtils.getIndex(5, s),webUtils.getIndex(6, s),webUtils.getIndex(7, s),webUtils.getIndex(8, s));
			break;
		
		//comments
		case("2"):
			s=webUtils.splitData(data);
	        udao.updataComment(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s),webUtils.getIndex(5, s),webUtils.getIndex(6, s),webUtils.getIndex(7, s));
			break;
		
		//drone
		case("3"):
			s=webUtils.splitData(data);
	        udao.updataDrone(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s));
			break;
		
		//dronecomment
		case("4"):
			s=webUtils.splitData(data);
	        udao.updataDroneComment(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s),webUtils.getIndex(5, s),webUtils.getIndex(6, s),webUtils.getIndex(7, s));
			break;
		
		//generations
		case("5"):
			s=webUtils.splitData(data);
		    udao.updataGeneration(webUtils.getIndex(0, s),webUtils.getIndex(1, s),webUtils.getIndex(2, s),webUtils.getIndex(3, s),webUtils.getIndex(4, s),webUtils.getIndex(5, s),webUtils.getIndex(6, s),webUtils.getIndex(7, s),webUtils.getIndex(8, s),webUtils.getIndex(9, s),webUtils.getIndex(10, s));
			break;
		
		}
	}

	@Override
	public void deleteAll(String source, String id) {
	     
		switch(source) {
		//user表
		case("0"):
			udao.deleteSome("user", id);
			break;
		
		//weibo 
		case("1"):
			udao.deleteSome("weibo", id);
			break;
		
		//comments
		case("2"):
			udao.deleteSome("comments", id);
			break;
		
		//drone
		case("3"):
			udao.deleteSome("drone", id);
			break;
		
		//dronecomment
		case("4"):
			udao.deleteSome("dronecomment", id);
			break;
		
		//generations
		case("5"):
			udao.deleteSome("generations", id);
			break;
		
		}
	}
   public void addUser(String token,Date regday,String regip,String uid,String nickname,String psd,String refresh_token,String isblock,String cookie,String avater,String ismanager) {
	   udao.addUser(token, regday, regip, uid, nickname, psd, refresh_token, isblock, cookie, avater, ismanager);
	}
}
