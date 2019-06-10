package com.lgz.cars.controller;

import com.lgz.cars.pojo.User;
import com.lgz.cars.service.UserService;
import com.lgz.cars.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    @ResponseBody
    public Map<String,Object> login(User user, HttpSession session){
        Map<String,Object> map=new HashMap<>();
        user.setPassword(MD5Util.MD5(user.getPassword()));
        user=userService.login(user);
        if (user!=null){
            if (user.getStatus()==2){
                map.put("code",0);
                map.put("msg","该账号被封号，请联系心悦会员");
            }else{
                session.setAttribute("loginUser",user);
                map.put("code",1);
            }
            }else {
            map.put("code",0);
            map.put("msg","用户名密码不正确！");
            }
            return map;
     }

}
