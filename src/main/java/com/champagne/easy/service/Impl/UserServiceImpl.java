package com.champagne.easy.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.champagne.easy.entity.User;
import com.champagne.easy.mapper.UserMapper;
import com.champagne.easy.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
