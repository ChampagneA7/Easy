package com.champagne.easy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.champagne.easy.entity.AddressBook;
import com.champagne.easy.mapper.AddressBookMapper;
import com.champagne.easy.service.AddressBookService;
import org.springframework.stereotype.Service;

@Service
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper, AddressBook> implements AddressBookService {
}
