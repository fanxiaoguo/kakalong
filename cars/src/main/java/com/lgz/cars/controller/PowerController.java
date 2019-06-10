package com.lgz.cars.controller;

import com.lgz.cars.pojo.Power;
import com.lgz.cars.service.PowerService;
import com.lgz.cars.util.ResBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/power")
public class PowerController {
    @Autowired
    private PowerService powerService;
    @RequestMapping("/toPower")
    public String toPower(){
        return "power/power";
    }
    @RequestMapping("/powerSj")
    @ResponseBody
    public Map<String, Object> powerSj(){
        List<Power> list=new ArrayList<>();
        Power power=new Power();
        list=powerService.getAll(power);
        Map<String,Object> map=new HashMap<>();
        if (list.size()>0){
            map.put("code",0);
            map.put("data",list);
        }
        return map;
    }
    @RequestMapping("/toEdit")
    public String toEdit(){
        return "power/power-edit";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResBean delete(Integer id){
        return powerService.delete(id);
    }

    @RequestMapping("/doEdit")
    @ResponseBody
    public ResBean updatePower(Power power, HttpSession session){
        return powerService.updatePower(power,session);
    }
}
