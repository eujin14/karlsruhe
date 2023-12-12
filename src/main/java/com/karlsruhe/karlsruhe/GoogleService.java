package com.karlsruhe.karlsruhe;



import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class GoogleService implements MailService {
	
	 @Autowired
	    private JavaMailSender mailSender;

	    // Replace "your-app-specific-password" with the generated app-specific password
	    private final String APP_PASSWORD = "your-app-specific-password";

	    @Override
	    public void sendMail(String to, String subject, String body) {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper;
	        try {
	            messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	            messageHelper.setFrom("gkdlel9254@gmail.com", "EKGKARLSRUHE");
	            messageHelper.setSubject(subject);
	            messageHelper.setTo(to);
	            messageHelper.setText(body, true);
	            mailSender.send(message);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	
	
