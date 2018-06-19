package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Adress;

public interface AdressRepository extends JpaRepository<Adress, Long> {
}
