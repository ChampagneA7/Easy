package com.champagne.easy.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.champagne.easy.dto.OrdersDto;
import com.champagne.easy.service.OrderDetailService;
import com.champagne.easy.service.OrdersService;
import com.champagne.easy.service.ShoppingCartService;
import com.champagne.easy.common.BaseContext;
import com.champagne.easy.common.R;
import com.champagne.easy.entity.OrderDetail;
import com.champagne.easy.entity.Orders;
import com.champagne.easy.entity.ShoppingCart;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    /**
     * 用户下单
     * @param orders
     * @return
     */
    @PostMapping("/submit")
    public R<String> submit(@RequestBody Orders orders) {

        log.info("订单数据：{}",orders);

        ordersService.submit(orders);

        return R.success("下单成功");
    }

    /**
     * 后台分页查询订单
     * @param page
     * @param pageSize
     * @param number
     * @param beginTime
     * @param endTime
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String number, String beginTime, String endTime) {
        //分页构造器
        Page<Orders> pageInfo = new Page<>(page, pageSize);
        //条件构造器
        LambdaQueryWrapper<Orders> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        //添加排序条件,根据订单时间进行排序
        lambdaQueryWrapper.orderByDesc(Orders::getOrderTime);

        //打印订单号
        log.info("订单号：{}",number);

        //添加订单号比较条件
        lambdaQueryWrapper.eq(number!=null,Orders::getNumber,number);


        //如果 开始时间 和 结束时间 都不为空
        if(beginTime != null && endTime != null){
            //SQL : where (orderTime BETWEEN beginTime AND endTime)
            //添加范围内查询条件 筛选出下单时间 大于等于 开始时间 小于等于 结束时间
            lambdaQueryWrapper.between(Orders::getOrderTime,beginTime,endTime);
        }

        //进行分页查询
        ordersService.page(pageInfo, lambdaQueryWrapper);

        return R.success(pageInfo);
    }

    /**
     *  更改订单状态
     * @param orders
     * @return
     */
    @PutMapping
    public R<String> status(@RequestBody Orders orders) {

        log.info(orders.toString());

        ordersService.updateById(orders);

        return R.success("派送成功");
    }

    /**
     * 用户订单
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/userPage")
    public R<Page> userPage(int page , int pageSize) {

        //分页构造器
        Page<Orders> pageInfo = new Page<>(page,pageSize);
        Page<OrdersDto> ordersDtoPage = new Page<>();

        //SQL：select * from orders where user_id = ? order by order_time desc

        //条件构造器
        LambdaQueryWrapper<Orders> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        //添加用户ID
        lambdaQueryWrapper.eq(Orders::getUserId, BaseContext.getCurrentId());
        //添加排序条件,根据订单时间进行倒序
        lambdaQueryWrapper.orderByDesc(Orders::getOrderTime);

        //进行分页查询
        ordersService.page(pageInfo,lambdaQueryWrapper);

        //对象拷贝 将pageInfo 拷贝 到 orderDtoPage 忽略 records
        BeanUtils.copyProperties(pageInfo,ordersDtoPage,"records");

        //获取pageInfo的records
        List<Orders> records = pageInfo.getRecords();

        //遍历records
        List<OrdersDto> list = records.stream().map((item) -> {

            OrdersDto ordersDto = new OrdersDto();
            //将 records的数据拷贝到 ordersDto
            BeanUtils.copyProperties(item,ordersDto);

            //SQL：select * from order_detail where order_id = ?

            //条件构造器
            LambdaQueryWrapper<OrderDetail> queryWrapper = new LambdaQueryWrapper<>();
            //通过records里面的订单ID [number] 对比 订单明细表的order_id 查询订单明细
            queryWrapper.eq(OrderDetail::getOrderId,item.getNumber());
            //查询出订单明细信息 列表
            List<OrderDetail> orderDetail = orderDetailService.list(queryWrapper);

            ordersDto.setOrderDetails(orderDetail);
            return ordersDto;
        }).collect(Collectors.toList());

        ordersDtoPage.setRecords(list);

        return R.success(ordersDtoPage);
    }

    /**
     * 再来一单
     * @param orders
     * @return
     */
    @PostMapping("/again")
    public R<String> again(@RequestBody Orders orders) {
        log.info("订单：{}",orders);

        //获取订单ID
        //SQL : select * from orders where id = ?
        Orders ordersData = ordersService.getById(orders.getId());
        String id = ordersData.getNumber();

        //通过订单ID查询订单明细
        //SQL : select * from order_detail where order_id = ?
        LambdaQueryWrapper<OrderDetail> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(OrderDetail::getOrderId,id);
        List<OrderDetail> orderDetailList = orderDetailService.list(lambdaQueryWrapper);
        log.info("该订单数据：{}",orderDetailList);

        //清空现在的购物车
        //SQL : delete * from shopping_cart where user_id = ?
        LambdaQueryWrapper<ShoppingCart> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ShoppingCart::getUserId,BaseContext.getCurrentId());
        shoppingCartService.remove(queryWrapper);

        //将订单明细里的数据添加到购物车
        List<ShoppingCart> shoppingCartList = orderDetailList.stream().map((item) -> {
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setName(item.getName());
            shoppingCart.setImage(item.getImage());
            shoppingCart.setUserId(BaseContext.getCurrentId());
            shoppingCart.setDishId(item.getDishId());
            shoppingCart.setSetmealId(item.getSetmealId());
            shoppingCart.setDishFlavor(item.getDishFlavor());
            shoppingCart.setNumber(item.getNumber());
            shoppingCart.setAmount(item.getAmount());
            return shoppingCart;
        }).collect(Collectors.toList());

        shoppingCartService.saveBatch(shoppingCartList);

        return R.success("Success！");
    }
}
