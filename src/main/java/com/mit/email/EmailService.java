package com.mit.email;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;

public abstract class EmailService {
	protected abstract Session getSession();
	
	protected abstract MimeMessage makeMessage(String to, String subject, String content) throws Exception;
	
	public abstract void sendMail(MimeMessage message) throws Exception;
}
