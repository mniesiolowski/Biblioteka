package pl.coderslab.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Category;
import pl.coderslab.repository.CategoryRepository;

import javax.validation.Valid;

@Controller
public class CategoryController {
        /*
                Full CRUD for Entity Category
         */

        private final CategoryRepository categoryRepository;

        public CategoryController(CategoryRepository categoryRepository) {
            this.categoryRepository = categoryRepository;
        }

        @GetMapping("/add-category")
        public String addTest(Model model) {
            model.addAttribute("category", new Category());
            return "category/add";
        }

        @PostMapping("/add-category")
        public String addTestrModel(@ModelAttribute @Valid Category category,BindingResult result) {
            if (result.hasErrors()) {
                return "category/add";
            } else
            categoryRepository.save(category);
            return "redirect:/add-category";

        } @GetMapping("/edit-category/{id}")
    public String categoryUpdate(Model model, @PathVariable long id ) {
        Category category = categoryRepository.findOne(id);
        model.addAttribute("category", category);
        return "category/edit";
    }

    @PostMapping("/edit-category")
    public String authorUpdateModel(@ModelAttribute  @Valid Category category,BindingResult result) {
        if (result.hasErrors()) {
            return  "category/edit";
        } else
            categoryRepository.save(category);
        return "redirect:list-category";
    }

        @GetMapping("/list-category")
        public String list(Model model) {
            model.addAttribute("category", categoryRepository.findAll());
            return "category/list";
        }
    }

