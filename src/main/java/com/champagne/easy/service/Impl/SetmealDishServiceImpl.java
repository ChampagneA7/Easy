package com.champagne.easy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.champagne.easy.entity.SetmealDish;
import com.champagne.easy.mapper.SetmealDishMapper;
import com.champagne.easy.service.SetmealDishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class SetmealDishServiceImpl extends ServiceImpl<SetmealDishMapper,SetmealDish> implements SetmealDishService {
}
