package com.itheima.service;

import com.itheima.pojo.Goods;
import com.itheima.pojo.Order;
import com.itheima.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface UserService {
    Boolean isUserExist(String uname,String password,String rights);

    int register(User user);

    int addGood(Goods goods);

    List<Goods> queryAllGoods(int uid);

    Goods queryGoodById(int uid,int gid);

    int updateGood(Goods good);

    int updateGoodBasicInfo(Goods good);

    int deleteGoodById(int uid, int gid);

    int queryUid(String uname);

    List<Goods> queryGoods();

    List<Goods> queryGoodsByName(String name);
    //添加购物车项
    int addCart(int uid,int gid,int consumer);

    int queryUidByGid(int gid);

    int updateConsumer(int uid,int gid);

    Integer updateGoodByGid(int consumer);

    List<Goods> queryGoodsByIdAndCart(int uid);

    int updateCartByGid(@RequestParam("gid") int gid);

    int addOrderInfo(Order order);

    int updateGoodAmount(int gid);

    List<Order> queryOrderByConsumer(int consumer);

    List<Order> queryOrderByUid(int uid);

    void updateOrderStatus(int oid,String situation);

    List<Order> queryOrderByUidAndSituation(int uid, String situation);

    List<Goods> queryGoodByCategory(String category);

    List<Order> queryOrderByConsumerAndSituation(int uid, String situation);

    boolean updateCartAmount(Integer gid, Integer cart);
}
