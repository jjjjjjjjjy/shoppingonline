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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        System.out.println(list);
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
        Map<String,Object> result=new HashMap<>();
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
            System.out.println("addGood--->"+goods);
            userService.addGood(goods);
            result.put("success",true);
            result.put("message","新增商品成功");
            System.out.println(result);
            return "redirect:/allGoods";//重定向
        }
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(@RequestParam("gid")int gid,Model model,HttpSession session){
        int uid= (int) session.getAttribute("UID");
        Goods good = userService.queryGoodById(uid,gid);
        model.addAttribute("QGood",good);
        System.out.println("update--->"+good);
        return "updateGood";
    }
    @RequestMapping("/updateGood")
    public String updateCourse(Goods good) throws IOException {
        MultipartFile file= good.getFile();
        if(file!=null){
            String fileName= file.getOriginalFilename();
            if(null!=fileName && fileName.equalsIgnoreCase("")){
                System.out.println("updateupdate-->"+good);
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

    //删除
    @RequestMapping("/deleteGood")
    public String deleteCourse(@RequestParam("gid")int gid,@RequestParam("uid")int uid){
        userService.deleteGoodById(uid,gid);
        return "redirect:/allGoods";
    }
    //查询
    @RequestMapping("/queryGoods")
    public String queryCourse( Model model){
        List<Goods> list=new ArrayList<Goods>();
        list= userService.queryGoods();
        if(list==null){
            model.addAttribute("error","未查到");
        }
        model.addAttribute("List",list);
        return "main";
    }
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
        System.out.println(gid);
        System.out.println(uid);
        System.out.println(c);
        userService.updateConsumer(c,gid);
        userService.addCart(uid,gid,c);
        return "redirect:/queryGoods";
    }
    @RequestMapping("/goOut")
    public String goOut(HttpSession session){
        int uid= (int) session.getAttribute("UID");
        userService.updateGoodByGid(uid);
        return "redirect:/user/goLogin";
    }
    @RequestMapping("/MyCart")
    public String myCart(HttpSession session){
        List<Goods> list=new ArrayList<Goods>();
        int uid= (int) session.getAttribute("UID");
        list= userService.queryGoodsByIdAndCart(uid);
        session.setAttribute("list1",list);
        return "cart";
    }
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
            count= Integer.parseInt(rows[i][1]);
            allprice+=Double.parseDouble(rows[i][2]);
            gid= Integer.parseInt(rows[i][3]);
            System.out.println("uid:"+uid+",count:"+count+",gid:"+gid);
            list.add(userService.queryGoodById(uid,gid));
            session.setAttribute("list2",list);
        }
        session.setAttribute("TOTAL",allprice);
        return "order";
    }
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
    @RequestMapping("/goMyOrder")
    public ModelAndView order(HttpSession session){
        List<Order> list= new ArrayList<>();
        ModelAndView mv = new ModelAndView("MyOrder");
        int uid= (int) session.getAttribute("UID");
        list=userService.queryOrderByConsumer(uid);
        mv.addObject("MyOrder",list);
        mv.addObject("UserService",userService);
        return mv ;
    }

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
    @RequestMapping("/deliver")
    public String deliverOrder(@RequestParam("oid") int oid) {
        // 根据订单号更新数据库中的订单状态为已发货
        userService.updateOrderStatus(oid);
        return "redirect:/orderManage"; // 重定向到订单管理页面
    }
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
//    @RequestMapping("/isCourseExist")
//    public void isCourseExit(String name, HttpServletResponse response) throws IOException {
//        System.out.println("para-->"+name);
//        response.setCharacterEncoding("utf-8");
//        if (courseService.isCourseExit(name)){
//            response.getWriter().print("该课程名已存在，请修改");
//        }else{
//            response.getWriter().close();
//        }
//    }
}
