/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.service;

import com.food.entity.Meal;
import com.food.repository.MealRepository;
import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

/**
 *
 * @author Luis
 */
@Service
public class MealService {
    
    @Autowired
    private MealRepository mealRepository;
    private static final Logger LOG = LogManager.getLogger(MealService.class);
    
    public Meal save(Meal meal){
        Meal m = new Meal();
        m.setName(meal.getName());
        meal.getMealFoodList().forEach(mf ->{
            LOG.info("MealFood: " + mf.toString());
           m.addFood(mf.getAmount(), mf.getFood());
           
        });
        LOG.info("MEAL TO BE SAVE: " + m.toString());
        return this.mealRepository.save(m);
    }
    
    public Meal findOne(Integer id){
        return this.mealRepository.findById(id).orElse(null);
    }
    
    public Page<Meal> findAll(PageRequest pageRequest){
        return this.mealRepository.findAll(pageRequest);
    }
    
    
}
