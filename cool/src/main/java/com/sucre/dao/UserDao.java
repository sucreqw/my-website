package com.sucre.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sucre.entity.DroneCommentEntity;
import com.sucre.entity.DroneEntity;
import com.sucre.entity.GenerationEntity;
import com.sucre.entity.SonEntity;
import com.sucre.entity.UserEntity;
import com.sucre.entity.commentEntity;
import com.sucre.entity.weiboEntity;

/**
 *数据库查询接口
 * @author sucre
 *
 */
public interface UserDao {
	/**
	 * 查询用户是否存在!
	 * @param account
	 * @return UserEntity
	 */
	 public UserEntity selectByAccount(@Param("token")String account);
	 /**
	    * 用cookie为当前用户登录
	  * @param cookie 当前用户的cookie
	  * @return UserEntity
	  */
	 public UserEntity selectByCookie(@Param("cookie")String cookie);
	
	 /**
	  * 发布一条新的微博
	  * @param token
	  * @param postday
	  * @param postip
	  * @param nickname
	  * @param avater
	  * @param content
	  * @param picurl
	  */
	 //insert into weibo (token,postday,postip,mid,nickname,avater,content,picurl) values(#{token},#{postday},#{postip},#{mid},#{nickname},#{avater},#{content},#{picurl})
	 public void addpost(@Param("token")String token,@Param("postday")Date postday,@Param("postip")String postip,@Param("mid") String mid,@Param("nickname")String nickname,@Param("avater")String avater,@Param("content")String content,@Param("picurl")String picurl);
     
	 /**
	  * 取新最排序的微博,每次取20条
	  * @return 降序排列的数据.
	  */
     public List<weiboEntity> getweibo(@Param("low")String low,@Param("up")String up);
     
     /**
      * 点赞!
      * @param id 微博的id
      */
     public void addlike(@Param("id")String id);
     /**
      * 点赞!无人机区
      * @param id 微博的id
      */
     public void addDroneLike(@Param("id")String id);
     /**
      * 对微博发布一条评论!
      * @param postip
      * @param postday
      * @param nickname
      * @param token
      * @param avater
      * @param content
      * @param wid
      */
     //(postip,postday,nickname,token,avater,content,wid)
     public void addcomment(@Param("postip") String postip,@Param("postday") Date postday,@Param("nickname") String nickname,@Param("token") String token,@Param("avater") String avater,@Param("content") String content,@Param("wid") String wid);
      
     /**
      * 取微博的评论列表
      * @param low
      * @param up
      * @param wid
      * @return
      */
     public List<commentEntity> getcomments(@Param("low")String low,@Param("up")String up,@Param("wid")String wid); 
     
     /**
      * 取无人机拍摄的初频或图片!
      * @param low
      * @param up
      * @return
      */
     public List<DroneEntity> getdrones(@Param("low")String low,@Param("up")String up);
     
     /**
      * 取无人区的评论列表
      * @param low
      * @param up
      * @param mid
      * @return
      */
     public List<DroneCommentEntity> getDroneComment(@Param("low")String low,@Param("up")String up,@Param("mid")String mid);
     /**
      * 对无人机区的作品评论
      * @param mid
      * @param token
      * @param avater
      * @param nickname
      * @param content
      * @param postip
      * @param postday
      */
     //<!-- mid int,token VARCHAR(32),avater VARCHAR(32),nickname VARCHAR(32),content VARCHAR(140) -->
     public void addDroneComment(@Param("mid") String mid,@Param("token") String token,@Param("avater") String avater,@Param("nickname") String nickname,@Param("content") String content,@Param("postip") String postip,@Param("postday") Date postday);
  
  /**
   * 取某一个人的详细信息
   * @param id
   * @return
   */
     public GenerationEntity getGenInfo(@Param("id")String id);
     /**
      * 取指定人的全部儿子的id和名字
      * @param id
      * @return
      */
     public SonEntity getSon(@Param("id") String id);
     /**
      * 指第一个人的信息,也等于返回全部信息,添加信息时可用于查询!
      * @param id
      * @return
      */
     public GenerationEntity getFirst(@Param("id") String id);
     
     /**
      * 添加一个人的父亲或者儿女
      * @param nickname
      * @param wife
      * @param gender
      * @param father
      * @param sons
      * @param datails
      * @param generation
      * @param birthday
      * @param avater
      */
     //                    (nickname,wife,gender,father,sons,datails,generation,birthday,avater)
    // public void addperson (@Param("nickname") String nickname,@Param("wife")String wife,@Param("gender")String gender,@Param("father")String father,@Param("sons")String sons,@Param("details")String details,@Param("generation")String generation,@Param("birthday")String birthday,@Param("avater")String avater);
       public void addperson (GenerationEntity genInfo);
     
     /**
      * 更新一个人的儿子或父亲的id,添加信息后调用
      * @param father
      * @param sons
      * @param id
      */
     //father,sons
     public void updataInfo(@Param("father")String father,@Param("sons")String sons, @Param("id")String id);
     /**
      * 用名字来取一个人的信息,搜索用!
      * @param nickname
      * @return
      */
     public List<SonEntity> getSomeone(@Param("nickname") String nickname);
     
     /**
      * 取user表的所有信息
      * @param low
      * @param up
      * @return
      */
     public List<UserEntity>selectUser(@Param("low")String low,@Param("up")String up);
     /**
      * 取weibo表的所有信息
      * @param low
      * @param up
      * @return
      */
     public List<weiboEntity>selectWeibo(@Param("low")String low,@Param("up")String up);
     /**
      * 取微博评论表的所有信息 comments
      * @param low
      * @param up
      * @return
      */
     public List<commentEntity>selectComment(@Param("low")String low,@Param("up")String up);
     /**
      * 取无人机作品的所有信息 drone
      * @param low
      * @param up
      * @return
      */
     public List<DroneEntity>selectDrone(@Param("low")String low,@Param("up")String up);
     /**
      * 取无人机区评论表所有信息 dronecomment
      * @param low
      * @param up
      * @return
      */
     public List<DroneCommentEntity>selectDroneComment(@Param("low")String low,@Param("up")String up);
     /**
      * 取族谱表的所有信息 generations
      * @param low
      * @param up
      * @return
      */
     public List<GenerationEntity>selectGeneration(@Param("low")String low,@Param("up")String up);
    
     /**
      * 更新user表数据
      * @param token
      * @param regday
      * @param regip
      * @param uid
      * @param nickname
      * @param psd
      * @param refresh_token
      * @param isblock
      * @param cookie
      * @param avater
      * @param ismanager
      */
     //token=#{token},regday=#{regday},regip=#{regip},uid=#{uid},nickname=#{nickname},psd=#{psd},refresh_token=#{refresh_token},isblock=#{isblock},cookie=#{cookie},avater=#{avater} ,ismanager=#{ismanager}
     public void updataUser(@Param("id")String id,@Param("token")String token,@Param("regday")String regday,@Param("regip")String regip,@Param("uid")String uid,@Param("nickname")String nickname,@Param("psd")String psd,@Param("refresh_token")String refresh_token,@Param("isblock")String isblock,@Param("cookie")String cookie,@Param("avater")String avater,@Param("ismanager")String ismanager);
    /**
     * 更新weibo表数据
     * @param token
     * @param postday
     * @param postip
     * @param mid
     * @param nickname
     * @param avater
     * @param content
     * @param picurl
     */
     // <!-- token, postday,postip,mid,nickname,avater,content,picurl -->
     public void updataWeibo(@Param("id")String id,@Param("token")String token,@Param("postday")String postday,@Param("postip")String postip,@Param("mid")String mid,@Param("nickname")String nickname,@Param("avater")String avater,@Param("content")String content,@Param("picurl")String picurl);
    /**
     * 更新weibocomment数据
     * @param postip
     * @param postday
     * @param nickname
     * @param token
     * @param avater
     * @param content
     * @param wid
     */
     //<!-- postip,postday,nickname,token,avater,content,wid -->
     public void updataComment(@Param("id")String id,@Param("postip")String postip,@Param("postday")String postday,@Param("nickname")String nickname,@Param("token")String token,@Param("avater")String avater,@Param("content")String content,@Param("wid")String wid);
    /**
     * 更新无人机区作品
     * @param type
     * @param urls
     * @param likecount
     * @param content
     */
     // <!-- type,urls,likecount,content -->
     public void updataDrone(@Param("id")String id,@Param("type")String type,@Param("urls")String urls,@Param("likecount")String likecount,@Param("content")String content);
     /**
      * 更新无人机区作品评论数据
      * @param mid
      * @param token
      * @param avater
      * @param nickname
      * @param content
      * @param postip
      * @param postday
      */
     // <!-- mid, token ,avater ,nickname ,content,postip,postday-->
     public void updataDroneComment(@Param("id")String id,@Param("mid")String mid,@Param("token")String token,@Param("avater")String avater,@Param("nickname")String nickname,@Param("content")String content,@Param("postip")String postip,@Param("postday")String postday);
    /**
     *  更新族谱数据!
     * @param nickname
     * @param wife
     * @param gender
     * @param father
     * @param sons
     * @param details
     * @param generation
     * @param birthday
     * @param avater
     * @param cookie
     */
     //<!--nickname,wife,gender,father,sons,details,generation,birthday,avater,cookie-->
     public void updataGeneration(@Param("id")String id,@Param("nickname")String nickname,@Param("wife")String wife,@Param("gender")String gender,@Param("father")String father,@Param("sons")String sons,@Param("details")String details,@Param("generation")String generation,@Param("birthday")String birthday,@Param("avater")String avater,@Param("cookie")String cookie);
   
     /**
      * 删除指定数据表的数据
      * @param table
      * @param id
      */
     public void deleteSome(@Param("table") String table,@Param("id") String id);
     /**
        * 添加一条无人区作品
      * @param type
      * @param urls
      * @param likecount
      * @param content
      */
     // <!-- type,urls,likecount,content -->
     public void addDrone(@Param("type")String type,@Param("urls")String urls,@Param("likecount")String likecount,@Param("content")String content);
     
     /**
      * 注册一个新用户
      * @param token
      * @param regday
      * @param regip
      * @param uid
      * @param nickname
      * @param psd
      * @param refresh_token
      * @param isblock
      * @param cookie
      * @param avater
      * @param ismanager
      */
     //token,regday,regip,uid,nickname,psd,refresh_token,isblock,cookie,avater,ismanager
     public void addUser(@Param("token")String token,@Param("regday")Date regday,@Param("regip")String regip,@Param("uid")String uid,@Param("nickname")String nickname,@Param("psd")String psd,@Param("refresh_token")String refresh_token,@Param("isblock")String isblock,@Param("cookie")String cookie,@Param("avater")String avater,@Param("ismanager")String ismanager);
	
}
