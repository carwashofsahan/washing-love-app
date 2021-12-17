package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.wl.Enum.UserState;
import org.wl.dto.AuthenticationRequest;
import org.wl.dto.Otp;
import org.wl.dto.Role;
import org.wl.dto.User;
import org.wl.service.MyUserDetailsService;
import org.wl.service.OtpService;
import org.wl.service.RoleService;
import org.wl.service.UserService;
import org.wl.util.CommonUtil;
import org.wl.util.WashingLoveResponse;
import org.wl.util.jwtUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@SuppressWarnings({"rawtypes", "DuplicatedCode", "unused", "UnnecessaryLocalVariable", "SpringMVCViewInspection", "unchecked", "CaughtExceptionImmediatelyRethrown", "RedundantThrows", "SpringJavaAutowiredFieldsWarningInspection"})
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    private MyUserDetailsService userDetailsService;
    @Autowired
    RoleService roleService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private jwtUtil jwtTokenUtil;
    @Autowired
    private HttpSession httpSession;
    @Autowired
    private OtpService otpService;
    @Value("${spring.mail.username}")
    private String senderEmail;


    /**
     * update User State.
     *
     * @param userid the id related to the specific user to change the state.
     * @param state  the state to be changed.
     * @return Responce Entity.
     */
    @PutMapping("/change")
    @ResponseBody
    public ResponseEntity updateState(HttpServletRequest request, @RequestParam String userid, @RequestParam String state) throws Exception {
        try {
            User userdto = userService.findUserById(userid);
            if (userdto != null) {
                if (state.equals("ACCEPTED")) {
                    userdto.setState(UserState.ACCEPTED);
                } else if (state.equals("REJECTED")) {
                    userdto.setState(UserState.REJECTED);
                } else if (state.equals("LOCK")) {
                    userdto.setState(UserState.LOCK);
                } else if (state.equals("UNLOCK")) {
                    userdto.setState(UserState.UNLOCK);
                } else if (state.equals("DELETED")) {
                    ;
                    userdto.setState(UserState.DELETED);
                } else {
                    userdto.setState(UserState.PENDING);
                }

                Boolean updated = userService.updateState(userdto);
                if (updated) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "No user to update state"), HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * view login page.
     *
     * @return Model and View.
     */
    @GetMapping("/loginView")
    public ModelAndView authview() {
        final ModelAndView modelAndView = new ModelAndView("auth/login");
        return modelAndView;
    }

    /**
     * edmin email view
     *
     * @return Model and View.
     */
    @GetMapping("/admin/email")
    public ModelAndView adminEmail(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/admin/email");
    }

    /**
     * common email
     * @return model and view.
     */
    @GetMapping("/common/email")
    public ModelAndView commonEmail(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/common/email");
    }



    /**
     * view signup page.
     * @return Model and View.
     */
    @GetMapping("/signupView")
    public ModelAndView authSignUp() {
        ModelAndView modelAndView = new ModelAndView("auth/signUp");
        return modelAndView;
    }

    /**
     * logout
     *
     * @return Model and View
     */
    @GetMapping("/logout")
    public ModelAndView viewLogOut() {
        ModelAndView modelAndView = new ModelAndView("auth/login");
        httpSession.removeAttribute("token");
        httpSession.removeAttribute("user");
        httpSession.removeAttribute("Authorization");
        return modelAndView;
    }

    /**
     * Authenticate user.
     *
     * @param username the username of user to login.
     * @param password the password of user to login
     * @return Model and View.
     */

    @PostMapping("/authentications")
    public ResponseEntity createAuthenticationToken(@RequestParam String username, @RequestParam String password) throws Exception {
        AuthenticationRequest authenticationRequestDto = new AuthenticationRequest();
        authenticationRequestDto.setUsername(username);
        authenticationRequestDto.setPassword(password);
        try {
            Authentication authenticate = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authenticationRequestDto.getUsername(), authenticationRequestDto.getPassword())
            );

            final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequestDto.getUsername());
            final String jwt = jwtTokenUtil.generateToken(userDetails);
            httpSession.setAttribute("Authorization", "Bearer " + jwt);
            System.out.println("Bearer " + jwt);


            User userDto = userService.searchUserByEmail(authenticationRequestDto.getUsername());
            userDto.setToken(jwt);

            Role roledto = roleService.searchRoleById(userDto.getRole().getId());
            if (userDto.getState() == UserState.ACCEPTED) {
                if (roledto.getName().equalsIgnoreCase("CUSTOMER")) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success", userDto), HttpStatus.OK);
                } else if (roledto.getName().equalsIgnoreCase("DETAILER")) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success", userDto), HttpStatus.OK);
                } else if (roledto.getName().equalsIgnoreCase("ADMIN")) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success", userDto), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (BadCredentialsException e) {
            return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
        }
    }

    /**
     * Authenticate user.
     *
     * @param username the username of user to login.
     * @param password the password of user to login
     * @return Model and View.
     */

    @PostMapping("/authentications_model")
    public ModelAndView createAuthenticationModelToken(HttpSession session,@RequestParam String username, @RequestParam String password) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        AuthenticationRequest authenticationRequestDto = new AuthenticationRequest();
        authenticationRequestDto.setUsername(username);
        authenticationRequestDto.setPassword(password);
        try {
            Authentication authenticate = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(authenticationRequestDto.getUsername(), authenticationRequestDto.getPassword())
            );

            final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequestDto.getUsername());
            final String jwt = jwtTokenUtil.generateToken(userDetails);
            System.out.println(jwt);
            User userDto = userService.searchUserByEmail(authenticationRequestDto.getUsername());

            Role roledto = roleService.searchRoleById(userDto.getRole().getId());
            if (userDto.getState() == UserState.ACCEPTED) {
                if (roledto.getName().equalsIgnoreCase("CUSTOMER")) {


                    modelAndView.setViewName("redirect:/dashboards/customer");
                    session.setAttribute("token", jwt);
                    session.setAttribute("user", userDto.getId());
                    session.setAttribute("name", userDto.getFirstname());
                    session.setAttribute("userType", userDto.getRole().getName());
                    session.setAttribute("Authorization", "Bearer " + jwt);
                    return modelAndView;
                } else if (roledto.getName().equalsIgnoreCase("DETAILER")) {
                    modelAndView.setViewName("redirect:/dashboards/detailer");
                    session.setAttribute("token", jwt);
                    session.setAttribute("user", userDto.getId());
                    session.setAttribute("name", userDto.getFirstname());
                    session.setAttribute("userType", userDto.getRole().getName());
                    session.setAttribute("Authorization", "Bearer " + jwt);
                    return modelAndView;
                } else if (roledto.getName().equalsIgnoreCase("ADMIN")) {
                    modelAndView.setViewName("redirect:/dashboards/admin");
                    session.setAttribute("token", jwt);
                    session.setAttribute("user", userDto.getId());
                    session.setAttribute("name", userDto.getFirstname());
                    session.setAttribute("userType", userDto.getRole().getName());
                    session.setAttribute("Authorization", "Bearer " + jwt);
                    return modelAndView;
                } else {
                    modelAndView.setViewName("redirect:/users/loginView");
                    modelAndView.addObject("err-msg", "INVALID USER");
                    return modelAndView;
                }
            } else {
                modelAndView.setViewName("redirect:/users/loginView");
                modelAndView.addObject("err-msg", "USER NOT ACCEPTED");
                return modelAndView;
            }
        } catch (BadCredentialsException e) {
            modelAndView.setViewName("auth/login");
            modelAndView.addObject("login_error", "Incorrect username or password");
            return modelAndView;
        }
    }

    /**
     * Register user.
     *
     * @param userDto the userDto of user register.
     * @return Response Entity.
     */

    @PostMapping("/sign_up")
    @ResponseBody
    public ResponseEntity SignUp(HttpServletRequest request, @Valid @RequestBody User userDto) throws Exception {
        try {
            String id = UUID.randomUUID().toString();
            Role roleDto = roleService.searchRoleByName(userDto.getRole().getName());
            userDto.setRole(roleDto);
            userDto.setId(id);

            if (roleDto.getName().equalsIgnoreCase("CUSTOMER")) {
                userDto.setState(UserState.ACCEPTED);
            } else if (roleDto.getName().equalsIgnoreCase("DETAILER")) {
                userDto.setState(UserState.PENDING);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }

            User userDto1 = userService.searchUserByEmail(userDto.getEmail());
            if (userDto1 == null) {
                boolean isSaved = userService.addUser(userDto);
                if (isSaved) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Successfully registered"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Registration Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "User Already Exists"), HttpStatus.OK);
            }
        } catch (Exception e) {
            return new ResponseEntity(new WashingLoveResponse(500, "Registration Failed"), HttpStatus.OK);
        }
    }

    /**
     * getUser by ID
     *
     * @param id user ID
     * @return Responce Entity.
     */
    @GetMapping("/{id}")
    public ResponseEntity getUserById(HttpServletRequest request, @PathVariable final String id) throws Exception {
        try {
            User userById = userService.findUserById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", userById), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get admin emails
     * @return Responce Entity.
     */
    @GetMapping("/sender")
    public ResponseEntity getAdminEmail(HttpServletRequest request) throws Exception {
        try {
            return new ResponseEntity(new WashingLoveResponse(200, "Success", senderEmail), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll users
     *
     * @return Responce Entity.
     */
    @GetMapping()
    public ResponseEntity getAll(HttpServletRequest request) throws Exception {
        try {
            List<User> all = userService.getAll();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get All users by type.
     *
     * @param userType  user type.
     * @return Responce Entity.
     */
    @GetMapping("/type")
    public ResponseEntity getAllByType(HttpServletRequest request, @RequestParam String Usertype) throws Exception {
        System.out.println(Usertype);
        try {
            List<User> all = userService.getAll();
            List<User> allSelected = new ArrayList<>();

            for (User user:all) {
                System.out.println("/////////////");
                System.out.println(Usertype);
                System.out.println(user.getRole().getName());
                if(user.getRole().getName().equals(Usertype)){


                    allSelected.add(user);
                }
            }

            return new ResponseEntity(new WashingLoveResponse(200, "Success", allSelected), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getUsers by state
     *
     * @param state  state.
     * @return Responce Entity.
     */
    @GetMapping("/state/{state}")
    public ResponseEntity getUsersByState(HttpServletRequest request, @PathVariable final UserState state) throws Exception {
        try {
            List<User> byState = userService.findByState(state);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", byState), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * update User .
     *
     * @param userDto user object.
     * @return Responce Entity.
     */
    @PutMapping()
    @ResponseBody
    public ResponseEntity updateUser(HttpServletRequest request, @RequestBody User userDto) throws Exception {
        try {
            Boolean updated = userService.update(userDto);
            if (updated) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * sendOtp
     *
     * @param email  email
     * @return Responce Entity.
     */
    @GetMapping("/otp/{email}")
    @ResponseBody
    public ResponseEntity sendOtp(HttpServletRequest request, @PathVariable String email) throws Exception {
        try {
            User user = userService.searchUserByEmail(email);
            if (user != null) {
                Otp otp = new Otp();
                otp.setEmail(email);
                otp.setOtp(CommonUtil.getOtp());
                boolean save = otpService.save(otp);
                if (save) {
                    user.setPassword("");
                    return new ResponseEntity(new WashingLoveResponse(200, "Success", user), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Otp can't send"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "User not allowed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * send signup OTP
     *
     * @param email  email
     * @return Responce Entity.
     */
    @GetMapping("/signUpOtp/{email}")
    @ResponseBody
    public ResponseEntity sendSignUpOtp(HttpServletRequest request, @PathVariable String email) throws Exception {
        try {

            Otp otp = new Otp();
            otp.setEmail(email);
            otp.setOtp(CommonUtil.getOtp());
            boolean save = otpService.sendSignUpOtpEmail(otp);
            if (save) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Otp can't send"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * verify OTP
     *
     * @param otp  otp
     * @return Responce Entity.
     */
    @PostMapping("/otp")
    @ResponseBody
    public ResponseEntity checkOtp(HttpServletRequest request, @RequestBody Otp otp) throws Exception {
        try {
            boolean checkOtp = otpService.checkOtp(otp);
            if(checkOtp){
                User user = userService.searchUserByEmail(otp.getEmail());
                user.setPassword("");
                return new ResponseEntity(new WashingLoveResponse(200, "Success", user), HttpStatus.OK);
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Incorrect otp"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * verify signup otp
     *
     * @param otp otp
     * @return Responce Entity.
     */
    @PostMapping("/signUpOtp")
    @ResponseBody
    public ResponseEntity checkSignUpOtp(HttpServletRequest request, @RequestBody Otp otp) throws Exception {
        try {
            boolean checkOtp = otpService.checkSignUpOtp(otp);
            if (checkOtp) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Incorrect otp"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * change password
     *
     * @param user  user.
     * @param otp  otp.
     * @return Responce Entity.
     */
    @PutMapping("/otp/{otp}")
    @ResponseBody
    public ResponseEntity changePassword(HttpServletRequest request, @RequestBody User user,@PathVariable int otp) throws Exception {
        try {
            User userById = userService.findUserById(user.getId());
            if(userById!=null){
                final Otp byId = otpService.findById(userById.getEmail());
                if(byId.getOtp()==otp) {
                    userById.setPassword(user.getPassword());
                    Boolean update = userService.update(userById);
                    if (update) {
                        return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                    }else {
                        return new ResponseEntity(new WashingLoveResponse(500, "Can't change password"), HttpStatus.OK);
                    }
                }else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Wrong otp"), HttpStatus.OK);
                }
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Incorrect user"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }

    @PutMapping("/mobile/otp/{otp}")
    @ResponseBody
    public ResponseEntity changePasswordForMobile(HttpServletRequest request, @RequestBody User user,@PathVariable int otp) throws Exception {
        try {
            User userById = userService.findUserByEmail(user.getEmail());
            if(userById!=null){
                final Otp byId = otpService.findById(userById.getEmail());
                if(byId.getOtp()==otp) {
                    userById.setPassword(user.getPassword());
                    Boolean update = userService.update(userById);
                    if (update) {
                        return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                    }else {
                        return new ResponseEntity(new WashingLoveResponse(500, "Can't change password"), HttpStatus.OK);
                    }
                }else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Wrong otp"), HttpStatus.OK);
                }
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Incorrect user"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Do not look into the httpsession params, instead handle user data through request params.
     * if it's not available then check for HTTP session and update the attributes if necessary
     *
     * @param request
     * @param redirectPath
     * @return
     */
    private ModelAndView handleModelAndViewWithUserData(HttpServletRequest request, String redirectPath) {
        ModelAndView modelAndView = new ModelAndView(redirectPath);
        String userParam = request.getParameter("user");
        String tokenParam = request.getParameter("token");
        String userTypeParam = request.getParameter("userType");
        // check httpsession attributes
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        Object userType = httpSession.getAttribute("userType");

        if (userParam != null && tokenParam != null) {
            // set values using request params
            modelAndView.addObject("token", tokenParam);
            modelAndView.addObject("user", userParam);
            modelAndView.addObject("userType", userTypeParam);
            System.out.println("user: " + userParam + ", token: " + tokenParam+ ", userType: " + userTypeParam);
        } else if(token != null && user != null ) {
            // set values using attributes in Httpsession
            modelAndView.addObject("token",token);
            modelAndView.addObject("user",user);
            modelAndView.addObject("userType",userType);
            System.out.println("from httpsession, user: " + user + ", token: " + token+ ", userType: " + userType);
        } else {
            return new ModelAndView("auth/login");
        }
        return modelAndView;
    }

}
