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
import org.wl.dto.Otp;
import org.wl.entity.User;
import org.wl.repo.OtpRepo;
import org.wl.repo.UserRepo;
import org.wl.service.OtpService;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

@Service
@Transactional
public class OtpServiceImpl implements OtpService {
    @Autowired
    private OtpRepo otpRepo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private ResourceLoader resourceLoader;
    @Value("${spring.mail.username}")
    private String senderEmail;
    @Value("${customer.support.email}")
    private String customerSupportEmail;

    @Override
    public boolean save(final Otp otp) throws Exception {
        try {
            User userByEmail = userRepo.findUserByEmail(otp.getEmail());
            org.wl.entity.Otp save = otpRepo.save(getOtp(otp));
            if (save != null) {
                sendEmail(userByEmail.getEmail(), "Washing Love Forget Password Otp", userByEmail, otp.getOtp());
                return true;
            }
            return false;
        } catch (Exception e) {
            throw e;
        }

    }

    @Override
    public boolean sendSignUpOtpEmail(Otp otp) throws Exception {
        try {
            org.wl.entity.Otp save = otpRepo.save(getOtp(otp));
            if (save != null) {
                sendSignUpOtpEmail(otp.getEmail(), "Washing Love SignUp Otp", otp.getOtp());
                return true;
            }
            return false;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean checkOtp(final Otp otp) throws Exception {
        try {
            User userById = userRepo.findUserByEmail(otp.getEmail());

            if (userById != null) {
                org.wl.entity.Otp byUser = otpRepo.findByEmail(userById.getEmail());
                if (byUser != null) {
                    if (byUser.getOtp() == otp.getOtp()) {
                        return true;
                    }
                }
            }
            return false;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean checkSignUpOtp(Otp otp) throws Exception {
        try {
            if (otp.getEmail() != null) {
                org.wl.entity.Otp byUser = otpRepo.findByEmail(otp.getEmail());
                if (byUser != null) {
                    if (byUser.getOtp() == otp.getOtp()) {
                        return true;
                    }
                }
            }
            return false;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Otp findById(String email) throws Exception {
        try {
            return getOtpDto(otpRepo.findByEmail(email));
        }catch (Exception e){
            throw e;
        }
    }

    private Otp getOtpDto(org.wl.entity.Otp otp) {
        Otp otpDto = mapper.map(otp, Otp.class);
        return otpDto;
    }

    private org.wl.entity.Otp getOtp(Otp otpDto) {
        org.wl.entity.Otp otp = mapper.map(otpDto, org.wl.entity.Otp.class);
        return otp;
    }

    @SneakyThrows
    private void sendEmail(String to, String subject, User user, int otp) {

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

        trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                "<p>Your otp code is "+otp+" .</p>" +
                "<p>Enjoy using washing love!!!</p>" +
                "<p>Thanks,</p>" +
                "<p>Washing Love Team</p>";

        trhtml += "</body></html>";



        helper.setText(trhtml, true);

        FileSystemResource res = new FileSystemResource(resource.getFile());
        helper.addInline("identifier1234", res);


        emailSender.send(message);
    }


    @SneakyThrows
    private void sendSignUpOtpEmail(String to, String subject,int otp) {

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

        trhtml += "<p>Hi " + ",</p>" +
                "<p>Your otp code is "+otp+" .</p>" +
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
