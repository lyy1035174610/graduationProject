package com.liyingyu.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liyingyu.entity.*;

/**
 * Created by YingyuLi on 2017/3/25.
 */
public class SaveController implements Controller{
    private static final Log logger = LogFactory.getLog(SaveController.class);
    @Override
     public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)throws Exception{
        logger.info("SaveController called.");
        ProductForm productForm = new ProductForm();
        productForm.setName(request.getParameter("name"));
        productForm.setDescription(request.getParameter("description"));
        productForm.setPrice(request.getParameter("price"));
        Product product = new Product();
        product.setName(productForm.getName());
        product.setDescription(productForm.getDescription());
        try{
            product.setPrice(Float.parseFloat(productForm.getPrice()));
            //这里要持久化到数据库
            //.......
        }catch(NumberFormatException e){
           // e.printStackTrace();
        }
        return new ModelAndView("/WEB-INF/jsp/ProductDetails.jsp","product",product);
    }
}
