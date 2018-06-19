package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Status;

public interface StatusRepository   extends JpaRepository<Status, Long> {
}
