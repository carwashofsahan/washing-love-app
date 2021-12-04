package org.wl.controller;

import org.wl.Enum.PackageStatus;
import org.wl.Enum.UserState;
import org.wl.dto.Packages;
import org.wl.dto.User;
import org.wl.service.PackageService;
import org.wl.service.UserService;
import org.wl.util.WashingLoveResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@SuppressWarnings({"rawtypes", "SpringJavaAutowiredFieldsWarningInspection", "unused", "CaughtExceptionImmediatelyRethrown", "unchecked", "DuplicatedCode"})
@RestController
@RequestMapping("/packages")
public class PackagesController {
    @Autowired
    private PackageService packageService;

    @Autowired
    private UserService userService;

    /**
     * Add Packages.
     *
     * @param packagesDto the Package dto to be saved.
     * @return Responce entity.
     */

    @PostMapping()
    @ResponseBody
    public ResponseEntity AddPackage(HttpServletRequest request, @RequestBody Packages packagesDto) throws Exception {

        try {
            String id = UUID.randomUUID().toString();
            packagesDto.setId(id);
            packagesDto.setState(PackageStatus.PENDING);

            User userById = userService.findUserById(packagesDto.getUser().getId());
            packagesDto.setUser(userById);

            if ((packagesDto.getUser().getState() == UserState.ACCEPTED) && (packagesDto.getUser().getRole().getName().equalsIgnoreCase("DETAILER"))) {
                Boolean save = packageService.save(packagesDto);
                if (save) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "USER NOT ACCEPTED OR USER ISNT A DETAILER"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Update Package.
     *
     * @param packagesDto the Package dto to be updated.
     * @param id          the id related to the specific Package dto to be updated.
     * @return Responce Entity.
     */

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity UpdatePackage(HttpServletRequest request, @PathVariable String id,
                                        @RequestBody Packages packagesDto) throws Exception {
        ModelAndView mav = new ModelAndView();
        try {
            Boolean updated = packageService.update(packagesDto);
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
     * update Package State.
     *
     * @param packageid the id related to the specific package to change the state.
     * @param state     the state to be changed.
     * @return Responce Entity.
     */

    @PutMapping("/state")
    @ResponseBody
    public ResponseEntity updateState(HttpServletRequest request, @RequestParam String packageid, @RequestParam String state) throws Exception {
        try {
            Packages packagesDto = packageService.findPackageById(packageid);

            if (packagesDto != null) {
                if(state.equals("ACCEPTED")){
                    packagesDto.setState(PackageStatus.ACCEPTED);
                }else if(state.equals("REJECTED")){
                    packagesDto.setState(PackageStatus.REJECTED);
                }else if(state.equals("DELETED")) {
                    packagesDto.setState(PackageStatus.DELETED);
                }else{
                    packagesDto.setState(PackageStatus.PENDING);
                }

                Boolean updated = packageService.updateState(packagesDto);
                if (updated) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "No package to update state"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * delete Package.
     *
     * @param id the id related to the specific Package to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity DeletePackage(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Boolean isDeleted = packageService.deletePackage(id);
            if (isDeleted) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get all Packages.
     *
     * @return Responce Entity.
     */

    @GetMapping()
    public ResponseEntity GetAllPackages(HttpServletRequest request) throws Exception {
        try {
            List<Packages> allPackages = packageService.getAllPackages();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allPackages), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Package by id.
     *
     * @param id the id related to the specific Package.
     * @return Responce Entity.
     */
    @GetMapping("/{id}")
    public ResponseEntity GetPackageById(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Packages packagesById = packageService.findPackageById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", packagesById), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Packages by user.
     *
     * @param id user ID
     * @return Responce Entity.
     */
    @GetMapping("/user/{id}")
    public ResponseEntity GetPackageByUserId(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            User userById = userService.findUserById(id);
            if(userById != null){
                List<Packages> packageByStateAndUserId = packageService.findPackagesByUser(userById);
                return new ResponseEntity(new WashingLoveResponse(200, "Success", packageByStateAndUserId), HttpStatus.OK);
            }else{
                return new ResponseEntity(new WashingLoveResponse(500, "No user"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Package by user and state.
     *
     * @param id user ID
     * @param state state
     * @return Responce Entity.
     */
    @GetMapping("/userandstate/{id}/{state}")
    public ResponseEntity GetPackageByUserIdAndState(HttpServletRequest request, @PathVariable String id, @PathVariable PackageStatus state) throws Exception {
        try {
            User userById = userService.findUserById(id);
            if(userById != null){
                List<Packages> packageByStateAndUserId = packageService.findPackageByStateAndUserId(state,userById);
                return new ResponseEntity(new WashingLoveResponse(200, "Success", packageByStateAndUserId), HttpStatus.OK);
            }else{
                return new ResponseEntity(new WashingLoveResponse(500, "No user"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Package by state.
     *
     * @param state state
     * @return Responce Entity.
     */
    @GetMapping("/state/{state}")
    public ResponseEntity getPackageByState(HttpServletRequest request, @PathVariable final PackageStatus state) throws Exception {
        try {
            List<Packages> packagesByState = packageService.findPackagesByState(state);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", packagesByState), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }
}
