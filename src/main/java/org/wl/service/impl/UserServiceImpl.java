package org.wl.service.impl;

import lombok.SneakyThrows;
import org.wl.Enum.NotificationState;
import org.wl.Enum.UserState;
import org.wl.dto.User;
import org.wl.entity.Notification;
import org.wl.entity.Role;
import org.wl.repo.NotificationRepo;
import org.wl.repo.RoleRepo;
import org.wl.repo.UserRepo;
import org.wl.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@SuppressWarnings({"RedundantThrows", "CaughtExceptionImmediatelyRethrown", "RedundantIfStatement", "UnnecessaryLocalVariable", "ConstantConditions", "SpringJavaAutowiredFieldsWarningInspection", "unused", "IfStatementWithIdenticalBranches"})
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepo repo;
    @Autowired
    private RoleRepo roleRepo;
    @Autowired
    private NotificationRepo notificationRepo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private ResourceLoader resourceLoader;
    @Value("${spring.mail.username}")
    private String senderEmail;
    @Value("${customer.support.email}")
    private String customerSupportEmail;

    @Override
    public User searchUserByEmail(String email) throws Exception {
        try {
            org.wl.entity.User user = repo.findUserByEmail(email);
            if (user == null) {
                return null;
            } else {
                return getUserDto(user);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean addUser(User user) throws Exception {

        try {
            org.wl.entity.User save = repo.save(getUser(user));
            if (save == null) {
                return false;
            } else {
                if (user.getRole().getName().equalsIgnoreCase("DETAILER")) {
                    Notification notification = new Notification();
                    notification.setId(UUID.randomUUID().toString());
                    notification.setSender(getUser(user));
                    Role admin = roleRepo.findRoleByName("ADMIN");
                    org.wl.entity.User byRole = repo.findByRole(admin);
                    notification.setReceiver(byRole);
                    notification.setNotification("Detailer registration request " + user.getFirstname() + " of id "+user.getId()+" is waiting for your approval.");
                    notification.setDate(new Date());
                    notification.setState(NotificationState.UNSEEN);
                    notificationRepo.save(notification);
                }
                sendEmail(user.getEmail(), "Washing Love User Registration", user, false);
                return true;
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public User findUserById(String userid) throws Exception {
        try {
            org.wl.entity.User user = repo.findUserById(userid);
            if (user == null) {
                return null;
            } else {
                return getUserDto(user);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public User findUserByEmail(String userid) throws Exception {
        try {
            org.wl.entity.User user = repo.findUserByEmail(userid);
            if (user == null) {
                return null;
            } else {
                return getUserDto(user);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean update(User userdto) throws Exception {
        if (repo.existsById(userdto.getId())) {
            org.wl.entity.User save = repo.save(getUser(userdto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such User for update..!");
        }
    }

    @Override
    public Boolean updateState(User userdto) throws Exception {
        if (repo.existsById(userdto.getId())) {
            org.wl.entity.User save = repo.save(getUser(userdto));
            if (save == null) {
                return false;
            } else {
                sendEmail(save.getEmail(), "Registration Status", userdto, true);
                return true;
            }
        } else {
            throw new RuntimeException("No such User for update..!");
        }
    }

    @Override
    public List<User> findByState(UserState state) throws Exception {
        List<org.wl.entity.User> allByState = repo.findAllByState(state);
        return allByState.stream().map(this::getUserDto).collect(Collectors.toList());
    }

    @Override
    public List<User> getAll() throws Exception {
        List<org.wl.entity.User> all = repo.findAll();
        return all.stream().map(this::getUserDto).collect(Collectors.toList());
    }

    private User getUserDto(org.wl.entity.User user) {
        User userDto = mapper.map(user, User.class);
        if (user.getImage() != null && user.getImage().length > 0){
            userDto.setImage(Base64.getEncoder().encodeToString(user.getImage()));
        }
        return userDto;
    }

    private org.wl.entity.User getUser(User userDto) {
        // find the user from the db
        org.wl.entity.User user = repo.findUserById(userDto.getId());
        // update the user using the data from DTO
        if (user != null) {
            user.setId(userDto.getId());
            user.setState(userDto.getState());
            user.setFirstname(userDto.getFirstname());
            user.setLastname(userDto.getLastname());
            user.setEmail(userDto.getEmail());
            user.setAddress(userDto.getAddress());
            user.setCity(userDto.getCity());
            user.setPhone(userDto.getPhone());
            user.setPassword(userDto.getPassword());
            // check if the profile image is provided and if does then save it as bytes
            try {
                if (userDto.getImage() != null && !userDto.getImage().isEmpty()) {
                    if (userDto.getImage().split(",").length > 1) {
                        user.setImage(Base64.getDecoder().decode(userDto.getImage().split(",")[1]));
                    } else {
                        user.setImage(Base64.getDecoder().decode(userDto.getImage()));
                    }
                } else {
                    System.out.println("No User image found!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // creating a new user object
            System.out.println("Creating a new User instance");
            user = mapper.map(userDto, org.wl.entity.User.class);
            // check if the profile image is provided and if does then save it as bytes
            try {
                if (userDto.getImage() != null && !userDto.getImage().isEmpty()) {
                    user.setImage(Base64.getDecoder().decode(userDto.getImage().split(",")[1]));
                } else {
                    System.out.println("No User image found!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @SneakyThrows
    private void sendEmail(String to, String subject, User user, Boolean isUpdateState) {

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
        if (isUpdateState) {
            if (user.getState() == UserState.ACCEPTED) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>Your registration is approved. You can start using the application. Thank you for being patient.</p>" +
                        "<p>If you need any assistance or if you have any complaints, you can directly send an email to " + customerSupportEmail + " </p>" +
                        "<p>Enjoy using washing love!!!</p>" +
                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else if (user.getState() == UserState.REJECTED) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>We are sorry to inform you that your registration request is rejected.</p>" +
                        "<p>You ca directly reach to the admin team via " + customerSupportEmail + " to know the reason. Please mention your registration request ID in the email</p>" +
                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else if (user.getState() == UserState.LOCK) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>Your account is locked byAdmin.Please reach to the support team via " + customerSupportEmail + " to know the reason.</p>" +
                        "<p>We appreciate your patience on this, if this is an issue from our side.</p>" +
                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else if (user.getState() == UserState.UNLOCK) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>Your account is UNLOCKED. You can continue using the application.</p>" +
                        "<p>Thanks for being patient.</p>" +
                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else {
                trhtml += "<p>registration still pending</p>";
            }
            trhtml += "</body></html>";
        } else {
            if (user.getRole().getName().equalsIgnoreCase("CUSTOMER")) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>You are successfuly signed up for washing love. We will be providing you the best support to wash your vehicle.</p>" +
                        "<p>If you need any assistance or if you have any complaints, you can directly send an email to " + customerSupportEmail + "</p>" +

                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else if (user.getRole().getName().equalsIgnoreCase("DETAILER")) {
                trhtml += "<p>Hi " + user.getFirstname() + ",</p>" +
                        "<p>Thank you for your interest in using Washing Love. Your registration request is sent to Admin. Your registration request ID is " + user.getId() + ". You will be receiving an email after the request is approved.</p>" +
                        "<p>If you need any assistance or if you have any complaints, you can directly send an email to " + customerSupportEmail + "</p>" +

                        "<p>Thanks,</p>" +
                        "<p>Washing Love Team</p>";
            } else {
                trhtml += "<p>Welcome Admin</p>";
            }
            trhtml += "</body></html>";
        }


        helper.setText(trhtml, true);

        FileSystemResource res = new FileSystemResource(resource.getFile());
        helper.addInline("identifier1234", res);


        emailSender.send(message);
    }


}
