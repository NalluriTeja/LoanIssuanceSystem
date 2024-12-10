package com.lti.homeloan.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lti.homeloan.model.EmailManager;


@Controller
@RequestMapping("/email")
public class EmailController {

    @Autowired
    EmailManager emailManager;

    @GetMapping("/form")
    public String showEmailForm() {
        return "emailForm"; // Corresponds to emailForm.jsp
    }

    @PostMapping("/send")
    public String sendEmail(
            @RequestParam("toemail") String toEmail,
            @RequestParam("subject") String subject,
            @RequestParam("message") String message,
            Model model) {
        
        String result = emailManager.sendEmail(toEmail, subject, message);
        model.addAttribute("result", result);
        return "result"; // Corresponds to result.jsp
    }
}