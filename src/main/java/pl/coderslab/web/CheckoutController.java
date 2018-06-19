package pl.coderslab.web;

import org.springframework.jca.cci.InvalidResultSetAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.*;
import pl.coderslab.repository.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
public class CheckoutController {
    private final CheckoutRepository checkoutRepository;
    private  final UserRepository userRepository;
    private final BooksRepository booksRepository;
    private final StatusRepository statusRepository;
    private final ReservedRepository reservedRepository;

    public CheckoutController(CheckoutRepository checkoutRepository, UserRepository userRepository, BooksRepository booksRepository, StatusRepository statusRepository, ReservedRepository reservedRepository) {
        this.checkoutRepository = checkoutRepository;
        this.userRepository = userRepository;
        this.booksRepository = booksRepository;
        this.statusRepository = statusRepository;
        this.reservedRepository = reservedRepository;
    }


    @ModelAttribute("users")
    List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @ModelAttribute("books")
    List<Books> getBooks() {
        return booksRepository.findAll();
    }



    @GetMapping("/add-checkout")
    public String addCheckout(Model model) {
        model.addAttribute("checkout", new Checkout());
        return "checkout/add";
    }

    @PostMapping("/add-checkout")
    public String addCheckoutModel(@ModelAttribute @Valid Checkout checkout, BindingResult result) {
       try { if (result.hasErrors()) {
           return "checkout/add";
       } else
           checkout.setCreated(LocalDateTime.now());
           checkout.setReturned(LocalDateTime.now().plus(2, ChronoUnit.WEEKS));
           checkoutRepository.save(checkout);
           booksRepository.findOne(checkout.getBooks().getId()).setStatus(statusRepository.findOne(2L));
           booksRepository.save(booksRepository.findOne(checkout.getBooks().getId()));
           return "redirect:/add-checkout";

       }catch (Exception e){
           return "admin/notfound";
       }

    } @GetMapping("/checkout-reserved-book/{id}/{id2}/{id3}")
    public String checkourReservedBook(@ModelAttribute Checkout checkout, Books books,User user,@PathVariable Long id,@PathVariable Long id2, @PathVariable Long id3){
       books=booksRepository.findOne(id2);
       user=userRepository.findOne(id);
        checkout.setCreated(LocalDateTime.now());
        checkout.setReturned(LocalDateTime.now().plus(2, ChronoUnit.WEEKS));
        checkout.setBooks(books);
        checkout.setUser(user);
        checkoutRepository.save(checkout);
        booksRepository.findOne(id2).setStatus(statusRepository.findOne(2L));
        booksRepository.save(booksRepository.findOne(id2));
        reservedRepository.delete(id3);
        return "redirect:/";
    }


    @GetMapping("/list-checkout")
    public String checkoutList(Model model) {
        model.addAttribute("checkout", checkoutRepository.findAll());
        return "checkout/list";
    }

    @GetMapping("/return-book-book/{id}")
    public String returnBook(@ModelAttribute Checkout checkout, @PathVariable long id){
        checkout = checkoutRepository.findOne(id);
        booksRepository.findOne(checkout.getBooks().getId()).setStatus(statusRepository.findOne(1L));
        booksRepository.save(booksRepository.findOne(checkout.getBooks().getId()));
        checkoutRepository.delete(id);
        return "/welcome/startworker";
    }
}
