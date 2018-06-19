package pl.coderslab.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.Test;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TestRepository;
import pl.coderslab.service.CurrentUser;

import java.util.List;

@Controller
public class TestController {

    private TestRepository testRepository;

    public TestController(TestRepository testRepository) {
        this.testRepository = testRepository;
    }


    @GetMapping("/")
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        for (Role role : entityUser.getRoles()) {
            if (role.getName().equals("USER")) {
                //return "redirect:/login";
                return "welcome/start";
            }
        }
        return "welcome/startworker";

    }

    @GetMapping("/start")

    public String adminstart(@AuthenticationPrincipal CurrentUser customUser) {
        try {
            User entityUser = customUser.getUser();
            return "this Admin " + entityUser.getId();
        } catch (Exception e) {
            return "redirect:/login";
        }

    }
}