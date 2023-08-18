package com.example.dormitory.repositories;

import com.example.dormitory.models.Information;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InformationRepository extends JpaRepository<Information,Long> {
    List<Information> findByNameDormitory(String nameDormitory);

}
