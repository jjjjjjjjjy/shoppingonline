package com.itheima.dao;

import com.itheima.pojo.Goods;
import com.itheima.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //登陆
    User queryUser(@Param("uname") String username, @Param("password") String password,@Param("rights") String rights);
    //添加用户
    int addUser(User user);
    //添加商品
    int addGood(Goods goods);
    //查询商家自己店铺内的商品
    List<Goods> queryAllGoods(int uid);

    Goods queryGoodById(@Param("uid")int uid,@Param("gid")int gid);

    int updateGood(Goods good);

    int updateGoodBasicInfo(Goods good);

    int deleteGoodById(@Param("uid")int uid,@Param("gid")int gid);

    int queryUid(@Param("uname") String uname);

    List<Goods> queryGoods();

    List<Goods> queryGoodsByName(String name);
    //添加购物车项
    int addCart(@Param("uid")int uid,@Param("gid")int gid,@Param("consumer") int consumer);

    int queryUidByGid(int gid);

    int updateConsumer(@Param("uid")int uid,@Param("gid")int gid);

    Integer updateGoodByGid(@Param("consumer")int consumer);

    List<Goods> queryGoodsByIdAndCart(@Param("uid") int uid);
}
