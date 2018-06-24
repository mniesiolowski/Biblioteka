package pl.coderslab.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.entity.Role;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TestRepository;
import pl.coderslab.service.CurrentUser;

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