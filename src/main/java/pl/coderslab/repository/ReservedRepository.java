package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Reserved;
import pl.coderslab.entity.User;

import java.util.List;

public interface ReservedRepository  extends JpaRepository<Reserved, Long> {
 List<Reserved> findAllByUser(User user);
}
