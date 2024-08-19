package catshap.butler.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

	private static final String SMTP_HOST = "smtp.gmail.com"; // Replace with your SMTP server
	private static final String SMTP_PORT = "587"; // Replace with your SMTP port
	private static final String SMTP_USER = "catshap653@gmail.com"; // Replace with your email
	private static final String SMTP_PASSWORD = "isfv foqa mnbx vjxa"; // Replace with your email password

	public static void sendEmail(String to, String subject, String body) throws MessagingException {
		Properties props = new Properties();
		props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.smtp.port", SMTP_PORT);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SMTP_USER, SMTP_PASSWORD);
			}
		});
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(SMTP_USER));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject(subject);
		message.setText(body);

		Transport.send(message);
	}
}
