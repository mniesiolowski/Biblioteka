package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Test;

public interface TestRepository extends JpaRepository<Test, Long> {


}
