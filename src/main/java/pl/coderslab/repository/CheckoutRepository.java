package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Checkout;
import pl.coderslab.entity.User;

import java.util.List;

public interface CheckoutRepository extends JpaRepository<Checkout, Long> {
    List<Checkout> findByUser(User user);
}
