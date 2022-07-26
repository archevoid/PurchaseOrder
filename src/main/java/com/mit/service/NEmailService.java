package com.mit.service;

import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

public abstract class NEmailService extends EmailService {
	private final String HOST = "smtp.naver.com";
	private final int PORT = 587;
	
	private Session session;
	
	@Resource(name = "SMTP_ID")
	private String SMTP_ID;
	@Resource(name = "SMTP_PW")
	private String SMTP_PW;
	
	
	protected Session getSession() {
		if(session == null) {
			Properties props = System.getProperties();
			
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.port", PORT);
			props.put("mail.smtp.starttls.enable", true);
			props.put("mail.smtp.auth", true);
			props.put("mail.smtp.ssl.protocols", "TLSv1.2");
			
			this.session = Session.getDefaultInstance(props);
		}
		
		return this.session;
	}
	
	public void sendMail(MimeMessage message) throws Exception {
		Transport transport = this.getSession().getTransport();
		
		transport.connect(this.HOST, this.SMTP_ID, this.SMTP_PW);
		
		transport.sendMessage(message, message.getAllRecipients());
		
		if(transport != null) {
			transport.close();
		}
	}
}
