package pl.coderslab.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.entity.*;
import pl.coderslab.repository.CheckoutRepository;
import pl.coderslab.repository.ReservedRepository;
import pl.coderslab.repository.RoleRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.CurrentUser;
import pl.coderslab.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UsersController {

    private final UserRepository userRepository;
    private final UserService saveUser;
    private final ReservedRepository reservedRepository;
    private final CheckoutRepository checkoutRepository;
    private final RoleRepository roleRepository;

    public UsersController(UserRepository userRepository, UserService saveUser, ReservedRepository reservedRepository, CheckoutRepository checkoutRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.saveUser = saveUser;
        this.reservedRepository = reservedRepository;
        this.checkoutRepository = checkoutRepository;
        this.roleRepository = roleRepository;
    }

    @ModelAttribute("reserved")
    List<Role> getAllRoles() {
        return roleRepository.findAll();
    }
    //     @ModelAttribute("reserved")
//         List<Reserved> getAllreserved() {return reservedRepository.findAll();
////     }
//     @ModelAttribute("checkout")
//     List<Checkout> getAllCheckouts(){return checkoutRepository.findAll();}

    @GetMapping("/add-user")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "user/add";
    }

    @PostMapping("/add-user")
    public String addUserModel(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user/add";
        } else
            user.setPassword(user.getPsel());
        user.createDefaultUsername();
        saveUser.saveUser(user);
        return "redirect:/add-user";
    }

    @GetMapping("/edit-user/u")
    public String authorUpdate(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        //  User user = userRepository.findOne(entityUser.getId());
        model.addAttribute("user", entityUser);
        return "user/edit";
    }

    @PostMapping("/edit-user")
    public String authorUpdateModel(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "user/edit";
        } else
            try {
                saveUser.saveUser(user);
                return "welcome/start";
            } catch (Exception e) {
                return "admin/notfound";
            }


    }

    @GetMapping("/list-user")
    public String userList(Model model) {
        model.addAttribute("user", userRepository.findAll());
        return "user/list";
    }

    @GetMapping("/info-user")
    public String infoUser(Model model, @AuthenticationPrincipal CurrentUser customUser) {

        User user = customUser.getUser();
        List<Reserved> reserved = reservedRepository.findAllByUser(user);
        List<Checkout> checkout = checkoutRepository.findByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("reserved", reserved);
        model.addAttribute("checkout", checkout);
        return "user/info";
    }

    @GetMapping("/add-worker")
    public String addWorker(Model model) {
        model.addAttribute("user", new User());
        return "user/addWorker";
    }

    @PostMapping("/add-worker")
    public String addUWorkerModel(@ModelAttribute User user) {
        user.setPassword(user.getPsel());
        user.createDefaultUsername();
        saveUser.saveUser2(user);
        return "redirect:/add-user";

    }
}