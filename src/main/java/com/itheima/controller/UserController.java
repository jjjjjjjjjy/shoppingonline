package com.itheima.controller;

import com.itheima.pojo.Goods;
import com.itheima.pojo.Order;
import com.itheima.service.UserService;
import com.itheima.service.UserServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@Controller
public class UserController {
    //controller调用service层
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService = new UserServiceImpl();

    //查询店铺的所有商品
    @RequestMapping("/allGoods")
    public String list(Model model,HttpSession session){
        int uid = (int) session.getAttribute("UID");
        List<Goods> list = userService.queryAllGoods(uid);
        model.addAttribute("list",list);
        return "merchant";
    }
    //新增商品
    @RequestMapping("/toAddGood")
    public String toAddPaper(){
        return "addGood";
    }
    @RequestMapping("/addGood")
    public String addGoods(@RequestParam("gname") String gname, @RequestParam("price") double price, @RequestParam("amount") int amount, @RequestParam("uid") int uid, @RequestParam("file") MultipartFile file, @Param("category") String category)throws IOException {
        Goods goods = new Goods();
        goods.setAmount(amount);
        goods.setUid(uid);
        goods.setGname(gname);
        goods.setPrice(price);
        goods.setCategory(category);
            if (!file.isEmpty()) {
                //原始文件名称
                String fileName = file.getOriginalFilename();
                String filePath = "E:/shoppingonline/src/main/webapp/statics/img/" + fileName;
                try {
                    // 保存文件
                    file.transferTo(new File(filePath));
                    goods.setImage(fileName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                goods.setImage("logo.png");
            }
            userService.addGood(goods);
            return "redirect:/allGoods";//重定向
        }
        //更新商品
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(@RequestParam("gid")int gid,Model model,HttpSession session){
        int uid= (int) session.getAttribute("UID");
        Goods good = userService.queryGoodById(uid,gid);
        model.addAttribute("QGood",good);
        return "updateGood";
    }
    @RequestMapping("/updateGood")
    public String updateCourse(Goods good) throws IOException {
        MultipartFile file= good.getFile();
        if(file!=null){
            String fileName= file.getOriginalFilename();
            if(null!=fileName && fileName.equalsIgnoreCase("")){
                userService.updateGoodBasicInfo(good);
                return "redirect:/allGoods";
            }
            String filePath="E:/shoppingonline/src/main/webapp/statics/img/"+fileName;
            File saveFile=new File(filePath);
            try{
                good.setImage(fileName);
                file.transferTo(saveFile);

            }catch (IOException e){
                e.printStackTrace();
            }
        }
        userService.updateGood(good);
        return "redirect:/allGoods";
    }

    //删除商品
    @RequestMapping("/deleteGood")
    public String deleteCourse(@RequestParam("gid")int gid,@RequestParam("uid")int uid){
        userService.deleteGoodById(uid,gid);
        return "redirect:/allGoods";
    }
    //查询所有商品，判断是否有类别传入，若有则按类别查询
    @RequestMapping("/queryGoods")
    public String queryGoods( Model model,HttpServletRequest request,HttpSession session){
        if (session.getAttribute("USER_SESSION") == null) {
            // 如果用户未登录，则跳转到登录页面
            return "redirect:/user/goLogin";
        }
        String category=request.getParameter("category");
        System.out.println(category);
        List<Goods> list=new ArrayList<Goods>();
        List<Goods> list1=new ArrayList<Goods>();
        list1=userService.queryGoodByCategory(category);
        System.out.println(list1);
        if (category == null){
            list= userService.queryGoods();
        }else {
            if (list1!=null){
                list=list1;
            }
        }
        if(list==null){
            model.addAttribute("error","未查到");
        }
        request.setAttribute("List",list);
        model.addAttribute("List",list);
        return "main";
    }
    //通过商品名模糊查询
    @RequestMapping("/queryGoodsByName")
    public String queryCourseByName(String search,Model model){
        List<Goods> list=new ArrayList<Goods>();
        list= userService.queryGoodsByName(search);
        if(list==null){
            model.addAttribute("error","未查到");
        }
        model.addAttribute("List",list);
        return "main";
    }
    //用户添加购物车
    @RequestMapping("/addCart")
    public String addCart(@RequestParam("gid")int gid,HttpSession session){
        int uid= userService.queryUidByGid(gid);
        int c= (int) session.getAttribute("UID");
        session.setAttribute("GID",gid);
        userService.updateConsumer(c,gid);
        userService.addCart(uid,gid,c);
        return "redirect:/queryGoods";
    }
    //注销
    @RequestMapping("/goOut")
    public String goOut(HttpSession session){
        int uid= (int) session.getAttribute("UID");
        userService.updateGoodByGid(uid);
        return "redirect:/user/goLogin";
    }
    //用户的我的购物车
    @RequestMapping("/MyCart")
    public String myCart(HttpSession session){
        if (session.getAttribute("USER_SESSION") == null) {
            // 如果用户未登录，则跳转到登录页面
            return "redirect:/user/goLogin";
        }
        List<Goods> list=new ArrayList<Goods>();
        int uid= (int) session.getAttribute("UID");
        list= userService.queryGoodsByIdAndCart(uid);
        session.setAttribute("list1",list);
        return "cart";
    }
    //用户从我的购物车中移除商品
    @RequestMapping(value="/removeCart/{gid}",method= RequestMethod.POST)
    @ResponseBody
    public String removeCart(@PathVariable("gid")int gid)
    {
        try{
        userService.updateCartByGid(gid);
        return "success";
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
            return "fail";
        }
    }
    //用户转到订单页面去支付
    @RequestMapping("/goPay")
    public String goPay(HttpServletRequest request,HttpSession session){
        List<Goods> list=new ArrayList<Goods>();
        int uid,count,gid;
        double allprice=0;
        String[] selectedRows = request.getParameter("selectedRows").split(";");
        String[][] rows = new String[selectedRows.length][4];
        for (int i = 0; i < selectedRows.length; i++) {
            String[] row = selectedRows[i].split(",");
            for (int j = 0; j < 4; j++) {
                rows[i][j] = row[j];
            }
        }
        for(int i=0;i<selectedRows.length;i++){
            uid= Integer.parseInt(rows[i][0]);
            allprice+=Double.parseDouble(rows[i][2]);
            gid= Integer.parseInt(rows[i][3]);
            count= userService.queryGoodById(uid,gid).getCart();
            list.add(userService.queryGoodById(uid,gid));
            session.setAttribute("list2",list);
        }

        session.setAttribute("TOTAL",allprice);
        return "order";
    }
    //添加订单信息
    @RequestMapping("/addOrder")
    public String addOrder(HttpSession session, @RequestParam("address") String address){
        List<Goods> list= (List<Goods>) session.getAttribute("list2");
        List<Order> list1=new ArrayList<Order>();
        session.setAttribute("Address",address);
        for (Goods goods : list) {
            Order order=new Order();
            order.setGid(goods.getGid());
            order.setAmount(goods.getCart());
            order.setAddress(address);
            order.setUid(goods.getUid());
            order.setPrice(goods.getPrice()*goods.getCart());
            order.setSituation("未发货");
            order.setConsumer(goods.getConsumer());
            userService.addOrderInfo(order);
            list1.add(order);
            userService.updateGoodAmount(goods.getGid());
            userService.updateCartByGid(goods.getGid());
        }
        System.out.println(list1);
        session.setAttribute("Order",list1);
        return "redirect:/goMyOrder";//重定向到我的订单
    }
    //查看我的订单
    @RequestMapping("/goMyOrder")
    public Object order(HttpSession session, HttpServletRequest request){
        if (session.getAttribute("USER_SESSION") == null) {
            // 如果用户未登录，则跳转到登录页面
            return "redirect:/user/goLogin";
        }
        String situation=request.getParameter("situation");
        List<Order> list= new ArrayList<>();
        ModelAndView mv = new ModelAndView("MyOrder");
        int uid= (int) session.getAttribute("UID");
        if (situation!=null){
            list=userService.queryOrderByConsumerAndSituation(uid,situation);
        }else {
            list=userService.queryOrderByConsumer(uid);
        }

        mv.addObject("MyOrder",list);
        mv.addObject("UserService",userService);
        return mv ;
    }
    //商家的订单管理
    @RequestMapping("/OrderManage")
    public ModelAndView orderManage(HttpSession session){
        List<Order> list= new ArrayList<>();
        int uid= (int) session.getAttribute("UID");
            list=userService.queryOrderByUid(uid);
        ModelAndView mv = new ModelAndView("orderManage");
        mv.addObject("OrderManage", list);
        mv.addObject("UserService", userService);
        return mv;
    }
    //商家发货操作
    @RequestMapping("/deliver")
    public String deliverOrder(@RequestParam("oid") int oid) {
        // 根据订单号更新数据库中的订单状态为已发货
        userService.updateOrderStatus(oid,"已发货");
        return "redirect:/orderManage"; // 重定向到订单管理页面
    }
    //用户收获操作
    @RequestMapping("/delivery")
    public String deliveryOrder(@RequestParam("oid") int oid) {
        // 根据订单号更新数据库中的订单状态为已发货
        System.out.println("enter delivery");
        userService.updateOrderStatus(oid,"已收货");
        return "redirect:/goMyOrder"; // 重定向到订单管理页面
    }
    //商家查看未发货订单
    @RequestMapping("/unshipped")
    public ModelAndView unshipped(HttpSession session) {
        List<Order> list= new ArrayList<>();
        int uid= (int) session.getAttribute("UID");
        list=userService.queryOrderByUidAndSituation(uid,"未发货");
        ModelAndView mv = new ModelAndView("orderManage");
        mv.addObject("OrderManage", list);
        mv.addObject("UserService", userService);
        return mv;
    }

    @RequestMapping("/goodDescription")
    public String goodDescription(@Param("gid")int gid,HttpSession session){
        int uid=userService.queryUidByGid(gid);
        Goods goods=userService.queryGoodById(uid,gid);
        session.setAttribute("GoodDescription",goods);
        return "goodDescription";
    }

    @RequestMapping("/updateCartAmount")
    public String updateCart(@RequestParam("gid") Integer gid,@RequestParam("cart") Integer cart) {
        boolean result = userService.updateCartAmount(gid, cart);
        return "redirect:/MyCart";
    }
}
