package com.tangjia.dao.impl;

import com.tangjia.dao.RootDao;
import com.tangjia.pojo.Root;
import com.tangjia.pojo.User;
import org.apache.commons.dbutils.QueryRunner;

import java.lang.ref.SoftReference;

public class RootDaoImpl extends BaseDao implements RootDao {

    @Override
    public int addRoot(Root root) {
        String sql="INSERT INTO Root (id,username,password) VALUES (?,?,?);";
        return update(sql,root.getId(),root.getUsername(),root.getPassword());
    }

    @Override
    public Root queryRootByUsernameAndPassword(String username, String password) {
        String sql="select * from Root where username=? and password=?;";
        return queryForOne(Root.class,sql,username,password);
    }

    @Override
    public Root queryRootByUsername(String username) {
        String sql="select * from Root where username=?";
        return  queryForOne(Root.class,sql,username);
    }
}
