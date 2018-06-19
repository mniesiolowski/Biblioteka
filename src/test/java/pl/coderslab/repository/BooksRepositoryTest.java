package pl.coderslab.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;
import pl.coderslab.entity.Books;

import java.awt.print.Book;

import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@DataJpaTest
public class BooksRepositoryTest {
    @Autowired
    private TestEntityManager entityManager;
    @Autowired
    private BooksRepository booksRepository;

    @Test
    public void find_by_title() {
        Books books = new Books();
        books.setTitle("Tytul");
        books.setIsbn("123456");
        books.setRokWydania("1111");
        entityManager.persist(books);

        Books result = booksRepository.findByTitle("Tytul");
        assertEquals(result.getTitle(), books.getTitle());

    }
}