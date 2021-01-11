package com.tangjia.service.impl;

import com.tangjia.dao.RootDao;
import com.tangjia.dao.impl.RootDaoImpl;
import com.tangjia.pojo.Root;
import com.tangjia.service.RootService;

public class RootServiceImpl implements RootService {
    private RootDao rootDao=new RootDaoImpl();
    @Override
    public Root register(String username, String password) {
        return rootDao.queryRootByUsernameAndPassword(username,password);
    }

    @Override
    public Root queryByUsername(String username) {
        return rootDao.queryRootByUsername(username);
    }

    @Override
    public int addRoot(Root root) {
        return rootDao.addRoot(root);
    }
}
