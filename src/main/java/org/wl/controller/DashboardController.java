package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.wl.util.CommonUtil;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView viewAdmin(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/admin/admin_dashboard");
    }

    /**
     * view customer bookwash.
     *
     * @return Model and View.
     */
    @GetMapping("/customer/book")
    public ModelAndView viewCustomerBookWash(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/customer/book_a_wash");
    }

    /**
     * view customer requests.
     *
     * @return Model and View.
     */
    @GetMapping("/customer/request")
    public ModelAndView viewCustomerMyRequest(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/customer/my_request");
    }

    /**
     * view customer dashboard.
     * @return Model and View.
     */
    @GetMapping("/customer")
    public ModelAndView viewCustomer(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/customer/customer_dashboard");
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
    public ModelAndView viewDetailer(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/detailer/detailer_dashboard");
    }

    /**
     * view customer notifications.
     *
     * @return Model and View.
     */

    @GetMapping("/customer/notification")
    public ModelAndView authview(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/customer/notification");
    }

    /**
     * @return customer's user profile view.
     */
    @GetMapping("/customer/userprofile")
    public ModelAndView viewUserProfile(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/customer/profile");
    }

    /**
     * @return detailer's packages view.
     */
    @GetMapping("/detailer/packages")
    public ModelAndView viewDetailerPackages(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/detailer/packages");
    }

    /**
     * @return detailers's bookings view.
     */
    @GetMapping("/detailer/bookings")
    public ModelAndView viewDetailerBookings(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/detailer/bookings");
    }


    /**
     * @return admin's report view.
     */
    @GetMapping("/admin/reports")
    public ModelAndView viewAdminReports(HttpServletRequest request) {
        return this.handleModelAndViewWithUserData(request,"dashboard/admin/reports");
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

        if (!CommonUtil.isLoggedIn) {
            return new ModelAndView("auth/login");
        } else if (userParam != null && tokenParam != null) {
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
            System.out.println("from httpsession, user: " + user + ", token: " + token+ ", userType: " + userType + " redirectPath: " + redirectPath);
        } else {
            System.out.println("Logout, user: " + user + ", token: " + token+ ", userType: " + userType +" redirectPath: " + redirectPath);
            return new ModelAndView("auth/login");
        }
        return modelAndView;
    }

}
