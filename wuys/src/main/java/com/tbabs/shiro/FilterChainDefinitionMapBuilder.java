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
        map.put("/user/**", "anon");
        map.put("/user/doLogout", "logout");
        // 设置全部页面访问权限为user
        map.put("/main/**", "roles[user]");
        return map;
    }
}
