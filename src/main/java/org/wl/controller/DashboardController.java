package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@SuppressWarnings("SpringMVCViewInspection")
@RestController
@RequestMapping("/dashboards")
public class DashboardController {

    @Autowired
    private HttpSession httpSession;

    /**
     * view admin dashboard.
     * @return Model and View.
     */
    @GetMapping("/admin")
    public ModelAndView viewAdmin() {
        ModelAndView modelAndView=new ModelAndView("dashboard/admin/admin_dashboard");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * view customer bookwash.
     *
     * @return Model and View.
     */
    @GetMapping("/customer/book")
    public ModelAndView viewCustomerBookWash() {
        ModelAndView modelAndView= new ModelAndView("dashboard/customer/book_a_wash");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
         modelAndView.addObject("token",token);
         modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * view customer requests.
     *
     * @return Model and View.
     */
    @GetMapping("/customer/request")
    public ModelAndView viewCustomerMyRequest() {
        ModelAndView modelAndView=new ModelAndView("dashboard/customer/my_request");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * view customer dashboard.
     * @return Model and View.
     */
    @GetMapping("/customer")
    public ModelAndView viewCustomer() {
        ModelAndView modelAndView= new ModelAndView("dashboard/customer/customer_dashboard");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    @GetMapping("/forgetPassword")
    public ModelAndView viewForgetPassword() {
        ModelAndView modelAndView= new ModelAndView("auth/forget_password");
        return modelAndView;
    }

    /**
     * view detailer dashboard.
     *
     * @return Model and View.
     */

    @GetMapping("/detailer")
    public ModelAndView viewDetailer() {
        ModelAndView modelAndView=new ModelAndView("dashboard/detailer/detailer_dashboard");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * view customer notifications.
     *
     * @return Model and View.
     */

    @GetMapping("/customer/notification")
    public ModelAndView authview() {
        ModelAndView modelAndView=new ModelAndView("dashboard/customer/notification");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * @return customer's user profile view.
     */
    @GetMapping("/customer/userprofile")
    public ModelAndView viewUserProfile() {
        ModelAndView modelAndView=new ModelAndView("dashboard/customer/profile");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * @return detailer's packages view.
     */
    @GetMapping("/detailer/packages")
    public ModelAndView viewDetailerPackages() {
        ModelAndView modelAndView=new ModelAndView("dashboard/detailer/packages");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

    /**
     * @return detailers's bookings view.
     */
    @GetMapping("/detailer/bookings")
    public ModelAndView viewDetailerBookings() {
        ModelAndView modelAndView= new ModelAndView("dashboard/detailer/bookings");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }


    /**
     * @return admin's report view.
     */
    @GetMapping("/admin/reports")
    public ModelAndView viewAdminReports() {
        ModelAndView modelAndView=new ModelAndView("dashboard/admin/reports");
        Object token = httpSession.getAttribute("token");
        Object user = httpSession.getAttribute("user");
        if(token==null || user==null){
            return new ModelAndView("auth/login");
        }
        modelAndView.addObject("token",token);
        modelAndView.addObject("user",user);
        return modelAndView;
    }

}
