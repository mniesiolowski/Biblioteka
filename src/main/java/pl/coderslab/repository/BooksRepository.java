package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Books;

import java.util.List;

public interface BooksRepository extends JpaRepository<Books, Long> {
    Books findByTitle(String title);
    List<Books> findByStatusId(long id);
    @Query(value = "Select * from books order by title", nativeQuery = true)
    List<Books> findAllbyTitle();
    @Query(value = "Select * from books order by status_id", nativeQuery = true)
    List<Books> findAllbyStatus();
}

