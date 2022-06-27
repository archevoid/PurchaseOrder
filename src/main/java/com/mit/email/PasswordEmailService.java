package com.mit.email;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class PasswordEmailService extends NEmailService {
	@Resource(name = "FROM_PASSWORD")
	private String FROM;
	@Resource(name = "FROM_NAME_PASSWORD")
	private String FROM_NAME;

	@Override
	public MimeMessage makeMessage(String to, String subject, String content) throws Exception {
		
		MimeMessage message = new MimeMessage(this.getSession());
		
		message.setFrom(new InternetAddress(this.FROM, this.FROM_NAME));
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=utf-8");
		
		return message;
	}

}
