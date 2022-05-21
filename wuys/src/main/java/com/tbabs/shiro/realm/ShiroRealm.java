package com.tbabs.shiro.realm;

import com.tbabs.pojo.User;
import com.tbabs.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    // 授权会被调用的方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 1. 从PrincipalCollection中来获取登录用户的信息
        Object principal = principals.getPrimaryPrincipal();
        User user = userService.selectUserById((Integer) principal);
        // 2. 利用登录的用户的信息来获取当前用户的角色或权限（查询数据库）
        Set<String> roles = new HashSet<>();
        if (user.getRole() == 1) {
            roles.add("admin");
        }else{
            roles.add("user");
        }
        // 3. 创建SimpleAuthenticationInfo对象，并设置其reles属性
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        // 4. 返回SimpleAuthenticationInfo对象
        return info;
    }

    // 登录会被调用的方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken)token;
        if (usernamePasswordToken.getUsername() == null || "".equals(usernamePasswordToken.getUsername())) {
            throw new UnknownAccountException("账号不存在");
        }
        Integer username = Integer.valueOf(usernamePasswordToken.getUsername());
        User user = userService.selectUserById(username);
        if (user == null) {
            throw new UnknownAccountException("账号不存在");
        }
        // 以下信息是从数据库中获取的
        // 1） principle：认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
        // 2）credentials：密码
        // 3）realmName：当前realm 对象的 name，调用父类的getName()方法即可
        Object credentials = user.getPassword();
        String realmName = getName();
        return new SimpleAuthenticationInfo(username, credentials, realmName);
    }
}
