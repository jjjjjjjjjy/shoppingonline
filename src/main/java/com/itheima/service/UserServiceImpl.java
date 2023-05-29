package com.itheima.service;

import com.itheima.dao.UserMapper;
import com.itheima.pojo.Goods;
import com.itheima.pojo.Order;
import com.itheima.pojo.User;

import java.util.List;

public class UserServiceImpl implements UserService{
    //service调dao层：组合Dao

    private UserMapper userMapper;
    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    public Boolean isUserExist(String uname, String password,String rights) {
        User user = userMapper.queryUser(uname,password,rights);
        return user!=null;
    }

    @Override
    public int register(User user) {
        return userMapper.addUser(user);
    }
    @Override
   public int addGood(Goods goods){
        return userMapper.addGood(goods);
    }

    @Override
    public List<Goods> queryAllGoods(int uid) {
        return userMapper.queryAllGoods(uid);
    }

    @Override
    public Goods queryGoodById(int uid,int gid) {
        return userMapper.queryGoodById(uid,gid);
    }

    @Override
    public int updateGood(Goods good) {
        return userMapper.updateGood(good);
    }

    @Override
    public int updateGoodBasicInfo(Goods good) {
        return userMapper.updateGoodBasicInfo(good);
    }

    @Override
    public int deleteGoodById(int uid, int gid) {
        return userMapper.deleteGoodById(uid,gid);
    }

    @Override
    public int queryUid(String uname) {
        return userMapper.queryUid(uname);
    }

    @Override
    public List<Goods> queryGoods() {
        return userMapper.queryGoods();
    }

    @Override
    public List<Goods> queryGoodsByName(String name) {
        return userMapper.queryGoodsByName(name);
    }

    @Override
    public int addCart(int uid,int gid,int c) {
        return userMapper.addCart(uid,gid,c);
    }

    @Override
    public int queryUidByGid(int gid) {
        return userMapper.queryUidByGid(gid);
    }

    @Override
    public int updateConsumer(int uid,int gid) {
        return userMapper.updateConsumer(uid,gid);
    }

    @Override
    public Integer updateGoodByGid(int consumer) {
        return userMapper.updateGoodByGid(consumer);
    }

    @Override
    public List<Goods> queryGoodsByIdAndCart(int uid) {
        return userMapper.queryGoodsByIdAndCart(uid);
    }

    @Override
    public int updateCartByGid(int gid) {
        return userMapper.updateCartByGid(gid);
    }

    @Override
    public int addOrderInfo(Order order) {
        return userMapper.addOrderInfo(order);
    }

    @Override
    public int updateGoodAmount(int gid) {
        return userMapper.updateGoodAmount(gid);
    }

    @Override
    public List<Order> queryOrderByConsumer(int consumer) {
        return userMapper.queryOrderByConsumer(consumer);
    }

    @Override
    public List<Order> queryOrderByUid(int uid) {
        return userMapper.queryOrderByUid(uid);
    }

    @Override
    public void updateOrderStatus(int oid) {
        userMapper.updateOrderStatus(oid);
    }

    @Override
    public List<Order> queryOrderByUidAndSituation(int uid, String situation) {
        return userMapper.queryOrderByUidAndSituation(uid,situation);
    }
}
