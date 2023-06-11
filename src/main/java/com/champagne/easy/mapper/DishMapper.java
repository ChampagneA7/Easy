package com.champagne.easy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.champagne.easy.entity.Dish;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DishMapper extends BaseMapper<Dish> {
}
