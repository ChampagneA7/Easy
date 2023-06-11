package com.champagne.easy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.champagne.easy.entity.AddressBook;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AddressBookMapper extends BaseMapper<AddressBook> {
}
