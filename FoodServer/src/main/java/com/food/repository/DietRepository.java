/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.food.repository;

import com.food.entity.Diet;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 *
 * @author Luis
 */
public interface DietRepository extends PagingAndSortingRepository<Diet, Integer> {
    
}
