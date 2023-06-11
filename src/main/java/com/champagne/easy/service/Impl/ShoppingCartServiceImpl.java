package com.champagne.easy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.champagne.easy.entity.ShoppingCart;
import com.champagne.easy.mapper.ShoppingCartMapper;
import com.champagne.easy.service.ShoppingCartService;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {
}
