package com.liyingyu.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by YingyuLi on 2017/3/25.
 */
public class InputController implements Controller{
    private static final Log logger = LogFactory.getLog(InputController.class);
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response){
        logger.info("InputController called.");
        return new ModelAndView("/WEB-INF/jsp/ProductForm.jsp");
    }
}
