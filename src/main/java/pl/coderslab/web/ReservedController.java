package pl.coderslab.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.*;
import pl.coderslab.repository.*;
import pl.coderslab.service.CurrentUser;

import java.security.PublicKey;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
public class ReservedController {
    private final ReservedRepository reservedRepository;
    private final BooksRepository booksRepository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final CategoryRepository categoryRepository;
    private final AuthorRepository authorRepository;

    public ReservedController(ReservedRepository reservedRepository, BooksRepository booksRepository, UserRepository userRepository, StatusRepository statusRepository, CategoryRepository categoryRepository, AuthorRepository authorRepository) {
        this.reservedRepository = reservedRepository;
        this.booksRepository = booksRepository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
        this.categoryRepository = categoryRepository;
        this.authorRepository = authorRepository;
    }


    @ModelAttribute("users")
    List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @ModelAttribute("books")
    List<Books> getBooks() {
        return booksRepository.findAll();
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
    List<Status> getSatus(){return statusRepository.findAll();}



    @GetMapping("/add-reserved/{id}")
    public String addReserved(Model model,@PathVariable long id) {
        Books books = booksRepository.findOne(id);
        model.addAttribute("books" ,books);
        model.addAttribute("reserved", new Reserved());
        return "books/reserved";

    }

    @PostMapping("/add-reserved/{id}")
    public String addCheckoutModel(@ModelAttribute Reserved reserved,@PathVariable long id,@AuthenticationPrincipal CurrentUser customUser) {
        try {
            User user =customUser.getUser();
            Books books = booksRepository.findOne(id);
            reserved.setUser(user);
            reserved.setBooks(books);
            reserved.setLocalDateTime(LocalDateTime.now());
            reserved.setReturned(LocalDateTime.now().plus(2, ChronoUnit.WEEKS));
            booksRepository.findOne(reserved.getBooks().getId()).setStatus(statusRepository.findOne(3L));
            reservedRepository.save(reserved);
            return "redirect:/search-books";
        } catch (Exception e) {
            return "admin/notfound";
        }

    }
    @GetMapping("/list-reserved")
    public String userList(Model model) {
        model.addAttribute("reserved", reservedRepository.findAll());
        return "reserved/list";}

        @GetMapping("remove-reserved-book/{id}")
    public String removeReservedBook(@ModelAttribute Reserved reserved, @PathVariable long id){
        reserved = reservedRepository.findOne(id);
        booksRepository.findOne(reserved.getBooks().getId()).setStatus(statusRepository.findOne(1L));
        booksRepository.save(booksRepository.findOne(reserved.getBooks().getId()));
        reservedRepository.delete(id);
        return "redirect:/list-reserved";
        }
}
