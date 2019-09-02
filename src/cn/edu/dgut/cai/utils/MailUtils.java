package cn.edu.dgut.cai.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;

public class MailUtils {
	
	/**
	 * 
	 * @param to :收件人
	 * @param code  ：激活码
	 */
	public static void sendMail(String to,String code) {
		//1、获得连接对象
		Properties props = new Properties();
		//设置发送的主机是谁，这里是localhost
		props.setProperty("mail.transport.protocol", "smtp"); 
		props.setProperty("mail.smtp.host", "smtp.163.com"); 
		props.setProperty("mail.smtp.port", "25"); 
		props.setProperty("mail.smtp.auth", "true"); 
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				//设置要发邮件的邮箱    用户名  密码
				return new PasswordAuthentication("Jerry_XCi@163.com","yuxi1234");
			}
		});
		//2、创建邮箱对象
		Message message = new MimeMessage(session);
		try {
			//设置发件人   用setFrom函数，参数是一个地址对象
			message.setFrom(new InternetAddress("Jerry_XCi@163.com"));
			
			//设置收件人   用addRecipient函数，RecipientType.TO表示发送方式，new InternetAddress(to)表示发送的地址
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			
			//设置标题
			message.setSubject("这是一个邮件的标题");
			//设置正文
			message.setContent("<h1>激活邮件!点下面链接完成激活操作!</h1>"
					+ "<h3>"
					+ "<a href='http://localhost:8080/Disk/user_active.action?code="+code+"'>http://localhost:8080/Disk/user_active.action?code="+code+"</a>"
					+ "</h3>", "text/html;charset=UTF-8");
			//3、发送邮件
			Transport.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
