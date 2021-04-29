package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// Interface
@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {

}
