package com.mit.service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public abstract class EmailService extends com.mit.service.Service {
	protected String FROM;
	protected String FROM_NAME;
	
	protected abstract Session getSession();
	
	public abstract void sendMail(MimeMessage message) throws Exception;

	public MimeMessage makeMessage(String[] to, String subject) throws Exception {
		
		MimeMessage message = new MimeMessage(this.getSession());
		
		InternetAddress[] adds = new InternetAddress[to.length];
		
		for(int i = 0; i < to.length; i++) {
			adds[i] = new InternetAddress(to[i]);
		}
		
		System.out.println(FROM + " " + FROM_NAME);
		
		message.setFrom(new InternetAddress(this.FROM, this.FROM_NAME));
		message.setRecipients(Message.RecipientType.TO, adds);
		message.setSubject(subject);
		
		return message;
	}
	
	public MimeMessage makeMessage(String[] to, String subject, String content) throws Exception {
		
		MimeMessage message = new MimeMessage(this.getSession());
		
		InternetAddress[] adds = new InternetAddress[to.length];
		
		for(int i = 0; i < to.length; i++) {
			adds[i] = new InternetAddress(to[i]);
		}
		
		System.out.println(FROM + " " + FROM_NAME);
		
		message.setFrom(new InternetAddress(this.FROM, this.FROM_NAME));
		message.setRecipients(Message.RecipientType.TO, adds);
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=utf-8");
		
		return message;
	}
	
	public MimeMessage makeMessage(String to, String subject, String content) throws Exception {
		return makeMessage(new String[] { to }, subject, content);
	}
	public MimeMessage makeMessage(String to, String subject) throws Exception {
		return makeMessage(new String[] { to }, subject);
	}
}
