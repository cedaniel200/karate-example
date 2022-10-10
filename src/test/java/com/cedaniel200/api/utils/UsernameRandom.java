package com.cedaniel200.api.utils;

import java.util.Random;

public class UsernameRandom {

    private static final String BASE_USERNAME = "cedaniel200";

    public String create(){
        return BASE_USERNAME + numberRandom();
    }

    private int numberRandom() {
        int min = 1;
        int max = 9999999;
        return new Random().nextInt(max - min + 1) + min;
    }
}
