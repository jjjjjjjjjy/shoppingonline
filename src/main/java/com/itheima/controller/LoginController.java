package com.itheima.controller;

import com.itheima.pojo.Goods;
import com.itheima.pojo.User;
import com.itheima.service.UserService;
import com.itheima.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService = new UserServiceImpl();
    @RequestMapping("/UserPage")
    public String main(){
        return "main";
    }
    @RequestMapping("/goLogin")
    public String login(){
        return "login";
    }
    @RequestMapping("/login")
    public String login(HttpSession session, User user, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request){
        String uname=user.getUname();
        String password=user.getPassword();

        String rights= request.getParameter("rights");

        //把用户信息存在session中
        if (uname==null||password==null){
            model.addAttribute("msg","用户名或密码不能为空！");
            return "login";
        }
        User user1=new User();
        user1.setUname(uname);
        user1.setPassword(password);
        user1.setRights(rights);
        if(userService.isUserExist(uname,password,rights))
        {
            int uid = userService.queryUid(uname);
            user1.setUid(uid);
            session.setAttribute("UID",uid);
            System.out.println("login==>"+user1);
            session.setAttribute("USER_SESSION",user1);
            if(rights.equals("1"))
            {
                return "redirect:/allGoods";//重定向return "merchant";
            }
            return "redirect:/queryGoods";
        }
        redirectAttributes.addFlashAttribute("message", "账号或密码错误");
        model.addAttribute("msg","用户名或密码错误，请重新登录！");
        return "login";
    }
    @RequestMapping("/goOut")
    public String goOut(HttpSession session){
        session.removeAttribute("USER_SESSION");
        return "redirect:goLogin";
    }


}
