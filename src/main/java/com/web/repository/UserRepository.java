package com.web.repository;

import com.web.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    @Query(value = "select u from User u where u.email = ?1 and u.password = ?2")
    Optional<User> findByEmailAndPassword(String email, String password);

    @Query(value = "select u from User u where u.email = ?1")
    Optional<User> findByEmail(String email);

    @Query(value = "select u.* from users u where u.id = ?1", nativeQuery = true)
    Optional<User> findById(Long id);

    @Query("select u from User u where u.role = ?1")
    List<User> findByRole(String role);

    @Query(value = "select u from User u where u.email = ?1 and u.id <> ?2")
    Optional<User> findByEmailAndId(String email, Long id);

    @Query("select count(u.id) from User u where u.role = ?1")
    Long tongUserByRole(String role);
}
