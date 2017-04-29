package com.liyingyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by YingyuLi on 2017/4/25.
 */
@Controller
public class HTMLController {
    @RequestMapping("/baozhagou")
    public String baozhagou(){
        return "baozhagou";
    }

    @RequestMapping("/dangzhen")
    public String dangzhen(){ return "dangzhen"; }

    @RequestMapping("/diaoxiang")
    public String diaoxiang(){ return "diaoxiang"; }

    @RequestMapping("/haigan")
    public String haigan(){ return "haigan"; }

    @RequestMapping("/jigan")
    public String jigan(){ return "jigan"; }

    @RequestMapping("/taidiaogan")
    public String taidiaogan(){ return "taidiaogan"; }

    @RequestMapping("/xiliugan")
    public String xiliugan(){ return "xiliugan"; }

    @RequestMapping("/xiugou")
    public String xiugou(){ return "xiugou"; }

    @RequestMapping("/yishiniyugou")
    public String yishiniyugou(){ return "yishiniyugou"; }

    @RequestMapping("/yuhu")
    public String yuhu(){ return "yuhu"; }

    @RequestMapping("/lasifen")
    public String lasifen(){ return "lasifen"; }

    @RequestMapping("/xuehuafen")
    public String xuehuafen(){ return "xuehuafen"; }

    @RequestMapping("/yuerwuhuaxing")
    public String yuerwuhuaxing(){ return "yuerwuhuaxing"; }

    @RequestMapping("/yuerrongsanxing")
    public String yuerrongsanxing(){ return "yuerrongsanxing"; }

    @RequestMapping("/erliaobizhong")
    public String erliaobizhong(){ return "erliaobizhong"; }

    @RequestMapping("/yuerfugouxing")
    public String yuerfugouxing(){ return "yuerfugouxing"; }

    @RequestMapping("/diaoyuxiaoyao")
    public String diaoyuxiaoyao(){ return "diaoyuxiaoyao"; }

    @RequestMapping("/jiumi")
    public String jiumi(){ return "jiumi"; }

    @RequestMapping("/yuantangkeli")
    public String yuantangkeli(){ return "yuantangkeli"; }

    @RequestMapping("/baoshidiaofa")
    public String baoshidiaofa(){ return "baoshidiaofa"; }

    @RequestMapping("/paoqiandiaofa")
    public String paoqiandiaofa(){ return "paoqiandiaofa"; }

    @RequestMapping("/laerdiaofa")
    public String laerdiaofa(){ return "laerdiaofa"; }

    @RequestMapping("/feiqiandiaofa")
    public String feiqiandiaofa(){ return "feiqiandiaofa"; }

    @RequestMapping("/taidiao")
    public String taidiao(){ return "taidiao"; }

    @RequestMapping("/jingjidiaofa")
    public String jingjidiaofa(){ return "jingjidiaofa"; }

    @RequestMapping("/chuantongdiaofa")
    public String chuantongdiaofa(){ return "chuantongdiaofa"; }

    @RequestMapping("/paogandiaofa")
    public String paogandiaofa(){ return "paogandiaofa"; }

    @RequestMapping("/caoyu")
    public String caoyu(){ return "caoyu"; }

    @RequestMapping("/bianyu")
    public String bianyu(){ return "bianyu"; }

    @RequestMapping("/guyu")
    public String guyu(){ return "guyu"; }

    @RequestMapping("/heiyu")
    public String heiyu(){ return "heiyu"; }

    @RequestMapping("/jiyu")
    public String jiyu(){ return "jiyu"; }

    @RequestMapping("/liyu")
    public String liyu(){ return "liyu"; }

    @RequestMapping("/qingyu")
    public String qingyu(){ return "qingyu"; }

    @RequestMapping("/shuiku")
    public String shuiku(){ return "shuiku"; }

    @RequestMapping("/heikang")
    public String heikang(){ return "heikang"; }

    @RequestMapping("/jianghe")
    public String jianghe(){ return "jianghe"; }

}
