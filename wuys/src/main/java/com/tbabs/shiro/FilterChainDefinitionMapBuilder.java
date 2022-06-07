package com.tbabs.shiro;

import java.util.LinkedHashMap;

public class FilterChainDefinitionMapBuilder {

    /*
        配置哪些页面需要受保护
        以及访问这些页面需要的权限.
            1. anon 可以被匿名访问
            2. authc 必须认证（登录）后才访问
            3. logout 登出
            3. 匹配原则是第一次优先匹配
            4. roles 角色过滤器
    */
    public LinkedHashMap<String, String> buildFilterChainDefinitionMap() {

        LinkedHashMap<String, String> map = new LinkedHashMap<>();
        // 登出
        map.put("/backstage/doLogout", "logout");
        // 只有学生才能操作/backstage/man/**
        map.put("/backstage/man/**", "roles[admin]");
        // 只有学生才能操作/backstage/stu/**
        map.put("/backstage/stu/**", "roles[user]");
        // 只要是前台的请求全部默认不需要认证
        map.put("/reception/**", "anon");
        // 只要是后台的请求全部需要认证
        map.put("/backstage/**", "authc");
        return map;
    }
}
