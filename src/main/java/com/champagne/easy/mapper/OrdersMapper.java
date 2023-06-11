package com.champagne.easy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.champagne.easy.entity.Orders;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {
}
