package com.champagne.easy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.champagne.easy.entity.OrderDetail;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderDetailMapper extends BaseMapper<OrderDetail> {
}
