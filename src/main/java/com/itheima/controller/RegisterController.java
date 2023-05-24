package com.itheima.controller;
import com.itheima.pojo.User;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
public class RegisterController {
    @Autowired
    private UserService userService;

    @RequestMapping("/toregister")
    public String showRegisterPage() {
        return "register";
    }

    @RequestMapping("/register")
    @ResponseBody
    public ModelAndView register(@RequestParam("uname") String uname,
                                 @RequestParam("password") String password,
                                 @RequestParam("rights") String rights,
                                 @RequestParam("captcha") String captcha,
                                 HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Map<String, Object> result = new HashMap<>();
        String code = (String) session.getAttribute("data-code");
        if (!captcha.equals(code)) {
            System.out.println("code====>" + code);
            System.out.println("captcha====>" + captcha);
            result.put("success", false);
            result.put("message", "验证码错误");
            System.out.println(result);
            mav.setViewName("register");
            mav.addObject("result", result);
            return mav;
        }
        // 注册用户
        User user = new User();
        user.setUname(uname);
        user.setPassword(password);
        user.setRights(rights);
        userService.register(user);
        result.put("success", true);
        result.put("message", "注册成功");
        System.out.println(result);
        mav.setViewName("login");
        mav.addObject("result", result);
        return mav;
    }
    @RequestMapping("/captcha")
    @ResponseBody
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 生成验证码
        String code = generateCaptcha();
        // 将验证码保存到session中
        HttpSession session = request.getSession();
        session.setAttribute("data-code", code);

        // 将验证码图片输出到页面
        response.setContentType("image/jpeg");
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(createImage(code), "jpeg", outputStream);
        outputStream.flush();
        outputStream.close();
    }

    private String generateCaptcha() {
        // 生成随机的4位验证码
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

    private BufferedImage createImage(String code) {
        // 创建验证码图片
        BufferedImage image = new BufferedImage(80, 30, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, 80, 30);
        g.setColor(Color.BLACK);
        g.setFont(new Font("Arial", Font.BOLD, 20));
        g.drawString(code, 20, 20);
        g.dispose();
        return image;
    }

}
