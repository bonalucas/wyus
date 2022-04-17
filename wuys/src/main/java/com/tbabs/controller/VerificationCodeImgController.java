package com.tbabs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 验证码
 */
@Controller
public class VerificationCodeImgController {
    @RequestMapping("/verificationcodeimg")
    public ModelAndView verificationcodeimg(){
        ModelAndView verificationcodeimg = new ModelAndView();
        verificationcodeimg.setViewName("verificationcodeimg");
        return verificationcodeimg;
    }
}
