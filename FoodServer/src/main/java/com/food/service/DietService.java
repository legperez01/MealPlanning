/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.service;

import com.food.entity.Diet;
import com.food.repository.DietRepository;
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
public class DietService {

    @Autowired
    private DietRepository dietRepository;
    private static final Logger LOG = LogManager.getLogger(DietService.class);

    public Diet save(Diet diet) {
        Diet d = new Diet();
        d.setName(diet.getName());
        diet.getDietMealList().forEach(dietMeal -> d.addMeal(dietMeal.getMeal()));                    
        return this.dietRepository.save(d);
    }

    public Diet findOne(Integer id) {
        return this.dietRepository.findById(id).orElse(null);
    }

    public Page<Diet> findAll(PageRequest pageRequest) {
        return this.dietRepository.findAll(pageRequest);
    }

}
