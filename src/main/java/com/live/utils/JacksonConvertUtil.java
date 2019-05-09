package com.live.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/10/29 16:44
 * @description:
 */
public class JacksonConvertUtil {
    private static ObjectMapper objectMapper  = new ObjectMapper();


    public static String getJsonFromObject(Object object){
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 反序列化对象字符串
     *
     * @param json
     * @param clazz
     * @return
     */
    public static <T> T getObjectFromJson(String json, Class<T> clazz) {
        try {
            return objectMapper.readValue(json, clazz);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 反序列化字符串成为对象
     * @param json
     * @param valueTypeRef
     * @return
     */
    public static <T> T getObjectFromJson(String json, TypeReference<T> valueTypeRef) {
        try {
            return objectMapper.readValue(json, valueTypeRef);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }




}
