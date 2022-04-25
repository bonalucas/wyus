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
        map.put("/login", "anon");
        map.put("/register", "anon");
        map.put("/logout", "logout");
//        map.put("/view/admin.jsp", "roles[admin]");
//        map.put("/**", "authc");
        return map;
    }
}
