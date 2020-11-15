/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.controller;

import com.food.entity.Meal;
import com.food.service.MealService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Luis
 */
@RefreshScope
@RestController
@RequestMapping("api/meal")
public class MealController {
    
    @Autowired
    private MealService mealService;
    private static final Logger LOG = LogManager.getLogger(MealController.class);
    
    @PostMapping
    public Meal save(@RequestBody Meal meal){
        LOG.info("Meal: " + meal.toString());
        return this.mealService.save(meal);
    }
    
    @GetMapping
    public Page<Meal> findAll(@RequestParam(value = "page", required = false, defaultValue = "0") int page, 
            @RequestParam(value = "size", required = false, defaultValue = "10") int size){
        return this.mealService.findAll(PageRequest.of(page, size));
        
    }
}
