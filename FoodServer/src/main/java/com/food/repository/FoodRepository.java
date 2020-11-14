/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.repository;

import com.food.entity.Food;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Luis
 */
public interface FoodRepository extends PagingAndSortingRepository<Food, Integer>{
    
    @Query("SELECT f FROM Food f WHERE f.name LIKE %:name%")
    List<Food> findByNameLike(@Param("name") String name);
    
    
}
