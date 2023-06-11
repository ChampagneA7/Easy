package com.champagne.easy.dto;

import com.champagne.easy.entity.Setmeal;
import com.champagne.easy.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
