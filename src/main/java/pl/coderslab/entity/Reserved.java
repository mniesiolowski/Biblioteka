package pl.coderslab.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Reserved {
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        private Long id;
        private LocalDateTime localDateTime;
       @ManyToOne
        private User user;
       @ManyToOne
        private Books books;
        private LocalDateTime returned;
    public Long getId() {
        return id;
    }

    public LocalDateTime getReturned() {
        return returned;
    }

    public void setReturned(LocalDateTime returned) {
        this.returned = returned;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getLocalDateTime() {
        return localDateTime;
    }

    public void setLocalDateTime(LocalDateTime localDateTime) {
        this.localDateTime = localDateTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }
}

