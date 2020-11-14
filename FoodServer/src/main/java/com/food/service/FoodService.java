/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.service;

import com.food.entity.Food;
import com.food.repository.FoodRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

/**
 *
 * @author Luis
 */
@Service
public class FoodService {
    
    @Autowired
    private FoodRepository foodRepository;
    
    public List<Food> findByNameLike(String name){
        return this.foodRepository.findByNameLike(name);
    }
    
    public Page<Food> findAll(PageRequest page){
        return this.foodRepository.findAll(page);
    }
    
}
