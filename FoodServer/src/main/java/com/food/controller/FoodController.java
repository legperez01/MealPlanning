/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.controller;

import com.food.entity.Food;
import com.food.service.FoodService;
import java.util.List;
import javax.websocket.server.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Luis
 */
@RefreshScope
@RestController
@RequestMapping("api/food")
public class FoodController {
    
    @Autowired
    private FoodService foodService;
    
    
    @GetMapping  
    public Page<Food> findAll(@RequestParam(value = "page", required = false, defaultValue = "0") int page, 
            @RequestParam(value = "size", required = false, defaultValue = "10") int size){
        return this.foodService.findAll(PageRequest.of(page, size));
    }
    
    @GetMapping("/findByNameLike/{name}")
    public List<Food> findByNameLike(@PathParam("name") String name){
        return this.foodService.findByNameLike(name);
    }
    
}
