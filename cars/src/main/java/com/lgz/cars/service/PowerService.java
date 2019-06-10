package com.lgz.cars.service;

import com.lgz.cars.pojo.Power;
import com.lgz.cars.util.ResBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PowerService {
    List<Power> getAll(Power power);
    ResBean delete(Integer id);
    ResBean updatePower(Power power, HttpSession session);
}
