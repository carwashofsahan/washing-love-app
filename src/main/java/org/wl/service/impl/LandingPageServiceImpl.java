package org.wl.service.impl;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wl.dto.CustomerEmail;
import org.wl.service.LandingPageService;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

@Service
@Transactional
public class LandingPageServiceImpl implements LandingPageService {
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private ResourceLoader resourceLoader;
    @Value("${spring.mail.username}")
    private String senderEmail;
    @Value("${customer.support.email}")
    private String customerSupportEmail;

    @Override
    public boolean sendEmail(CustomerEmail email) throws Exception {
        sendEmail(email.getEmail(),customerSupportEmail,email.getSubject(),email.getMessage(),email.getName());
        return true;
    }

    @SneakyThrows
    private void sendEmail(String from,String to, String subject, String Emaimessage,String name) {

        Resource resource = resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png");
        MimeMessage message = emailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(subject);


        String trhtml = "<html>" +
                "<head>" +
                "<style>" +
                "table, th, td {border: 1px solid black; border-collapse: collapse;}" +
                "p {font-size: 20px;}" +
                "</style>" +
                "</head>" +
                "<body>" +
                "<img style=\"width:110px;\" src='cid:identifier1234'>";

        trhtml += "<p>Hi " + "admin" + ",</p>" +
                "<p> "+Emaimessage+" .</p>" +
                "<p> "+from+"</p>"+
                "<p> "+name+"</p>";

        trhtml += "</body></html>";



        helper.setText(trhtml, true);

        FileSystemResource res = new FileSystemResource(resource.getFile());
        helper.addInline("identifier1234", res);


        emailSender.send(message);
    }
}
