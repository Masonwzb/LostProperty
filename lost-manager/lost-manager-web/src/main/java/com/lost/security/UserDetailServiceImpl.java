package com.lost.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.lost.mapper.TbUsersMapper;
import com.lost.pojo.TbUsers;
import com.lost.pojo.TbUsersExample;
import com.lost.pojo.TbUsersExample.Criteria;

import java.util.ArrayList;
import java.util.List;
@Service
/**
 * 认证类
 */
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private TbUsersMapper usersMapper;
    
	@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("经过了UserDetailServiceImpl");
        //构建角色列表
        List<GrantedAuthority> grantAuths = new ArrayList<>();
        grantAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

        //获取管理员
        TbUsers admin = null;
        
		TbUsersExample example = new TbUsersExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andUsernameEqualTo(username);
		System.out.println("---------------------------=：" + usersMapper.selectByExample(example));
		List<TbUsers> list = usersMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			admin = list.get(0);
		}
		
		if(admin !=  null){
            return new User(username,admin.getPassword(),grantAuths);
		}else{
			throw new BadCredentialsException("用户名或密码错误");
		}
			
		
    }
    
    
}
