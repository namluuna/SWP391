/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Service;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author ifyou
 */
public class SendMailService {

    public void sendVerifyAccount(String toEmail, String verifyCode) {
        //provide recipient's email ID
        String to = toEmail;
        //provide sender's email
        String from = "OnlineShoesStore@example.com";
        //provide Mailtrap's username
        final String username = "569d727e4b5d1c";
        //provide Mailtrap's password
        final String password = "461fd47168e99d";
        //provide Mailtrap's host address
        String host = "smtp.mailtrap.io";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        //create the Session object
        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);
            //set From email field
            message.setFrom(new InternetAddress(from));
            //set To email field

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //set email subject field
            message.setSubject("Kích hoạt tài khoản!");
            //set the content of the email message
//            message.setText("Just discovered that Jakarta Mail is fun and easy to use");
            message.setContent("<div\n"
                    + "      style=\"\n"
                    + "      width: 50vw;\n"
                    + "      margin: 0 auto;\n"
                    + "      padding: 20px 100px;\n"
                    + "      text-align: center; \n"
                    + "      border: 3px solid orange; \n"
                    + "      border-radius: 10px\n"
                    + "      \"\n"
                    + "    >\n"
                    + "    <h1>Quý khách hàng thân mến!</h1>\n"
                    + "      <h3>Cảm ơn bạn vì đã trở thành khách hàng của Online Shoes Store</h3>\n"
                    + "      <small\n"
                    + "        >Cảm ơn bạn vì đã tạo tài khoản. Xin hãy click vào nút bên dưới để kích hoạt tài khoản:</small>\n"
                    + "      <small\n"
                    + "        >Nếu bạn không tạo tài khoản, xin hãy bỏ qua email này.</small\n"
                    + "      >\n"
                    + "      <button\n"
                    + "        style=\"\n"
                    + "          padding: 10px;\n"
                    + "          border-radius: 10px;\n"
                    + "          border-color: rgb(255,69,0);\n"
                    + "          display: block;\n"
                    + "          margin: 20px auto;\n"
                    + "        \"\n"
                    + "      >\n"
                    + "        <a style=\"text-decoration: none\" href=\"http://localhost:8080/SWP_391/verify?token=" + verifyCode + "\">Kích hoạt tài khoản</a>\n"
                    + "      </button>\n"
                    + "      <h5>Nếu bạn có câu hỏi? <a href=\"\">Chúng tôi ở đây để giúp đỡ bạn</a></h5>\n"
                    + "    </div>",
                    "text/html");
            //send the email message
            Transport.send(message);
            System.out.println("Email Message Sent Successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendResetPassword(String toEmail, String resetPasswordToken) {
        //provide recipient's email ID
        String to = toEmail;
        //provide sender's email
        String from = "OnlineShoesStore@example.com";
        //provide Mailtrap's username
        final String username = "569d727e4b5d1c";
        //provide Mailtrap's password
        final String password = "461fd47168e99d";
        //provide Mailtrap's host address
        String host = "smtp.mailtrap.io";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        //create the Session object
        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);
            //set From email field
            message.setFrom(new InternetAddress(from));
            //set To email field

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //set email subject field
            message.setSubject("Kích hoạt tài khoản!");
            //set the content of the email message
//            message.setText("Just discovered that Jakarta Mail is fun and easy to use");
            message.setContent("<div\n"
                    + "      style=\"\n"
                    + "      width: 50vw;\n"
                    + "      margin: 0 auto;\n"
                    + "      padding: 20px 100px;\n"
                    + "      text-align: center; \n"
                    + "      border: 3px solid orange; \n"
                    + "      border-radius: 10px\n"
                    + "      \"\n"
                    + "    >\n"
                    + "    <h1>Quý khách hàng thân mến!</h1>\n"
                    + "      <h3>Mật khẩu của bạn đã được reset thành công!</h3>\n"
                    + "      <small\n"
                    + "        >Xin hãy click vào nút bên dưới để tiến hành đặt lại mật khẩu:</small>\n"
                    + "      <small\n"
                    + "        >Nếu bạn không reset mật khẩu, bạn có thể bỏ qua email này.</small\n"
                    + "      >\n"
                    + "      <button\n"
                    + "        style=\"\n"
                    + "          padding: 10px;\n"
                    + "          border-radius: 10px;\n"
                    + "          border-color: rgb(255,69,0);\n"
                    + "          display: block;\n"
                    + "          margin: 20px auto;\n"
                    + "        \"\n"
                    + "      >\n"
                    + "        <a style=\"text-decoration: none\" href=\"http://localhost:8080/SWP_391/SetNewPassword?token=" + resetPasswordToken + "\">Đặt lại mật khẩu</a>\n"
                    + "      </button>\n"
                    + "      <h5>Nếu bạn có câu hỏi?  <a href=\"\">Chúng tôi ở đây để giúp đỡ bạn</a></h5>\n"
                    + "    </div>",
                    "text/html");
            //send the email message
            Transport.send(message);
            System.out.println("Email Message Sent Successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    
    public void sendNewAccount(String toEmail, String newPassword) {
        //provide recipient's email ID
        String to = toEmail;
        //provide sender's email
        String from = "OnlineShoesStore@example.com";
        //provide Mailtrap's username
        final String username = "569d727e4b5d1c";
        //provide Mailtrap's password
        final String password = "461fd47168e99d";
        //provide Mailtrap's host address
        String host = "smtp.mailtrap.io";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        //create the Session object
        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);
            //set From email field
            message.setFrom(new InternetAddress(from));
            //set To email field

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //set email subject field
            message.setSubject("Kích hoạt tài khoản!");
            //set the content of the email message
//            message.setText("Just discovered that Jakarta Mail is fun and easy to use");
            message.setContent("<div\n"
                    + "      style=\"\n"
                    + "      width: 50vw;\n"
                    + "      margin: 0 auto;\n"
                    + "      padding: 20px 100px;\n"
                    + "      text-align: center; \n"
                    + "      border: 3px solid orange; \n"
                    + "      border-radius: 10px\n"
                    + "      \"\n"
                    + "    >\n"
                    + "    <h1>Cảm ơn bạn đã trở thành nhân viên của Online Shoes Store!</h1>\n"
                    + "      <h3>Quản trị viên đã tạo tài khoản cho bạn thành công!</h3>\n"
                    + "      <h3>Mật khẩu của bạn là: " + newPassword + "</h3>\n"
                    + "      <small\n"
                    + "        >Vui lòng click vào nút bên dưới để tiến hành đăng nhập</small>\n"
                    + "      <small\n"
                    + "      <button\n"
                    + "        style=\"\n"
                    + "          padding: 10px;\n"
                    + "          border-radius: 10px;\n"
                    + "          border-color: rgb(255,69,0);\n"
                    + "          display: block;\n"
                    + "          margin: 20px auto;\n"
                    + "        \"\n"
                    + "      >\n"
                    + "        <a style=\"text-decoration: none\" href=\"http://localhost:8080/SWP_391/login" + "\">Đăng nhập</a>\n"
                    + "      </button>\n"
                    + "      <h5>Nếu bạn có câu hỏi?  <a href=\"\">Chúng tôi ở đây để giúp đỡ bạn</a></h5>\n"
                    + "    </div>",
                    "text/html");
            //send the email message
            Transport.send(message);
            System.out.println("Email Message Sent Successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
        SendMailService se = new SendMailService();
        se.sendNewAccount("ifyouwant9612@gmail.com", "hello123");
    }
}
