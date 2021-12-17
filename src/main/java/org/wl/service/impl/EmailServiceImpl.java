package org.wl.service.impl;

import lombok.SneakyThrows;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wl.dto.Email;
import org.wl.entity.User;
import org.wl.repo.EmailRepo;
import org.wl.repo.UserRepo;
import org.wl.service.EmailService;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class EmailServiceImpl implements EmailService {
    @Autowired
    private EmailRepo emailRepo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private ResourceLoader resourceLoader;
    @Value("${spring.mail.username}")
    private String senderEmail;
    @Autowired
    private UserRepo userRepo;


    @Override
    public boolean save(Email email) throws Exception {
        org.wl.entity.Email save = emailRepo.save(getEmail(email));
        if(save!=null){
            return true;
        }
        return false;
    }

    @Override
    public List<Email> getAll() throws Exception {
        List<org.wl.entity.Email> all = emailRepo.findAll();
        return all.stream().map(this::getEmailDto).collect(Collectors.toList());
    }

    @Override
    public boolean reply(String to, String message,String emailId) throws Exception {

        User userByEmail = userRepo.findUserByEmail(to);
        if(userByEmail!=null){
            sendEmail(to,"Washing Love Admin Message",userByEmail,message);
            emailRepo.deleteById(emailId);
            return true;
        }

        return false;
    }

    private Email getEmailDto(org.wl.entity.Email email) {
        Email emailDto = mapper.map(email, Email.class);
        return emailDto;
    }

    private org.wl.entity.Email getEmail(Email emailDto) {
        org.wl.entity.Email email = mapper.map(emailDto, org.wl.entity.Email.class);
        return email;
    }

    @SneakyThrows
    private void sendEmail(String to, String subject, org.wl.entity.User user,String messageBody) {

        Resource resource = resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png");
        MimeMessage message = emailSender.createMimeMessage();
        message.setFrom(new InternetAddress(senderEmail, "Washing Love"));

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

        trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                "<p>"+messageBody+"</p>" +
                "<p>Enjoy using washing love!!!</p>" +
                "<p>Thanks,</p>" +
                "<p>Washing Love Team</p>";

        trhtml += "</body></html>";



        helper.setText(trhtml, true);

        FileSystemResource res = new FileSystemResource(resource.getFile());
        helper.addInline("identifier1234", res);


        emailSender.send(message);
    }
}
