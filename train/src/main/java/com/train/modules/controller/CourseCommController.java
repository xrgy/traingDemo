package com.train.modules.controller;

import com.train.modules.entity.CourseComm;
import com.train.modules.service.CourseCommService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Tanli on 2017/4/20 0020.
 */
@Controller
@RequestMapping(value = {"page/employee"})
public class CourseCommController {

    @Resource
    private CourseCommService courseCommService;

    @RequestMapping("commindex")
    public String commindex(HttpServletRequest request, HttpServletResponse response,
                            Model model)
    {
        String empid = request.getParameter("empid");
        String courseid = request.getParameter("courseid");
        model.addAttribute("empid",empid);
        model.addAttribute("courseid",courseid);
        return "/employee/staff_evaluate_course";
    }

    @RequestMapping("addContent")
    public String addContent(HttpServletRequest request, HttpServletResponse response,
                             Model model, CourseComm courseComm)
    {
        String msg = "";
        String temp = request.getParameter("empid");
        int empid = Integer.parseInt(temp);
        temp = request.getParameter("courseid");
        int courseid = Integer.parseInt(temp);
        courseComm.setEmpId(empid);
        courseComm.setCourseId(courseid);
        String level = request.getParameter("level");
        String content = request.getParameter("content");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date = new Date();
        courseComm.setContent(content);
        courseComm.setCommLevel(level);
        courseComm.setCommTime(date);
        int count = courseCommService.insertComm(courseComm);
        if(count>0)
            msg="评价成功";
        else
            msg = "OPS！评价失败！";
        return msg;
    }
}
