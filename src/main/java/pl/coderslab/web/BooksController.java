package pl.coderslab.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Author;
import pl.coderslab.entity.Books;
import pl.coderslab.entity.Category;
import pl.coderslab.entity.Status;
import pl.coderslab.repository.AuthorRepository;
import pl.coderslab.repository.BooksRepository;
import pl.coderslab.repository.CategoryRepository;
import pl.coderslab.repository.StatusRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
public class BooksController {
    private final BooksRepository booksRepository;
    private final CategoryRepository categoryRepository;
    private final AuthorRepository authorRepository;
    private final StatusRepository statusRepository;

    public BooksController(BooksRepository booksRepository, CategoryRepository categoryRepository, AuthorRepository authorRepository, StatusRepository statusRepository) {
        this.booksRepository = booksRepository;
        this.categoryRepository = categoryRepository;
        this.authorRepository = authorRepository;
        this.statusRepository = statusRepository;
    }

    @ModelAttribute("categories")
    List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("authors")
    List<Author> getAuthors() {
        return authorRepository.findAll();
    }

    @ModelAttribute("status")
    List<Status> getSatus() {
        return statusRepository.findAll();
    }

    @GetMapping("/add-books")
    public String addBooks(Model model) {
        model.addAttribute("books", new Books());
        return "books/add";
    }

    @PostMapping("/add-books")
    public String addBookModel(@ModelAttribute @Valid Books books, BindingResult result) {
        if (result.hasErrors()) {
            return "books/add";
        } else
            booksRepository.save(books);
        return "redirect:/add-books";

    }

    @GetMapping("/edit-books/{id}")
    public String bookUpdate(Model model, @PathVariable long id) {
        Books books = booksRepository.findOne(id);
        model.addAttribute("books", books);
        return "books/edit";
    }

    @PostMapping("/edit-books")
    public String bookUpdateModel(@ModelAttribute @Valid Books books, BindingResult result) {
        if (result.hasErrors()) {
            return "books/edit";
        } else

            booksRepository.save(books);
        return "redirect:list-books-edit";

    }

    //          List of all books
    @GetMapping("/list-books")
    public String list(Model model) {
        model.addAttribute("books", booksRepository.findAll());
        return "books/list";

    }

    //          List of all books sorted by title
    @GetMapping("/list-books-sort-title")
    public String listsortTitle(Model model) {
        model.addAttribute("books", booksRepository.findAllbyTitle());
        return "books/list";

    }

    //          List of all books sorted by status
    @GetMapping("/list-books-sort-status")
    public String listsortStatus(Model model) {
        model.addAttribute("books", booksRepository.findAllbyStatus());
        return "books/list";
    }

    //          List of all books that are 'Dostepna'
    @GetMapping("/search-books")
    public String search(Model model) {
        model.addAttribute("books", booksRepository.findByStatusId(1L));
        return "books/search";
    }
    //          Controll panel for Admin
    @GetMapping("/adding")
    public String controllPanel() {
        return "admin/controll";
    }

    //          List of all books for editions
    @GetMapping("/list-books-edit")
    public String listedit(Model model) {
        model.addAttribute("books", booksRepository.findAll());
        return "books/listedit";
    }
    //      Display full information about one book
    @GetMapping("/show/{id}")
    public String showDescreption(Model model, @PathVariable long id) {
        Books books = booksRepository.findOne(id);
        model.addAttribute("books", books);
        return "books/show";
    }
}
