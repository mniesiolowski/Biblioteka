package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.entity.Drink;

@Repository
public interface DrinkRepository extends JpaRepository<Drink, Long> {
}
