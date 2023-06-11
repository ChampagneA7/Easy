package com.champagne.easy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.champagne.easy.entity.DishFlavor;
import com.champagne.easy.mapper.DishFlavorMapper;
import com.champagne.easy.service.DishFlavorService;
import org.springframework.stereotype.Service;

@Service
public class DishFlavorServiceImpl extends ServiceImpl<DishFlavorMapper, DishFlavor> implements DishFlavorService {
}
