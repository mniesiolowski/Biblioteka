package pl.coderslab.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.entity.Author;
import pl.coderslab.repository.AuthorRepository;

import javax.validation.Valid;

@Controller
public class AuthorController {

    private final AuthorRepository authorRepository;

    public AuthorController(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    @GetMapping("/add-author")
    public String addTest(Model model) {
        model.addAttribute("author", new Author());
        return "author/add";
    }

    @PostMapping("/add-author")
    public String addTestrModel(@ModelAttribute @Valid Author author, BindingResult result) {
        if (result.hasErrors()) {
            return "author/add";
        } else
            author.setJoinnames(author.getFirstName() + " " + author.getLastName());
        authorRepository.save(author);
        return "redirect:/add-author";

    }
    @GetMapping("/edit-author/{id}")
    public String authorUpdate(Model model, @PathVariable long id ) {
        Author author = authorRepository.findOne(id);
        model.addAttribute("author", author);
        return "author/edit";
    }

    @PostMapping("/edit-author")
    public String authorUpdateModel(@ModelAttribute  @Valid Author author, BindingResult result) {
        if (result.hasErrors()) {
            return "author/edit";
        } else {
            author.setJoinnames(author.getFirstName() + " " + author.getLastName());
            authorRepository.save(author);
            return "redirect:list-author";
        }
    }
    @GetMapping("/list-author")
    public String list(Model model) {
        model.addAttribute("author", authorRepository.findAll());
        return "author/list";
    }
}