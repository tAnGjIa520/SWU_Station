package com.tangjia.test;

import com.tangjia.dao.RootDao;
import com.tangjia.dao.impl.RootDaoImpl;
import com.tangjia.pojo.Root;
import org.junit.Test;

import static org.junit.Assert.*;

public class RootDaoImplTest {
    private RootDao rootDao=new RootDaoImpl();
    @Test
    public void addRoot() {
        Root root = new Root(null, "root", "root");
        rootDao.addRoot(root);
    }

    @Test
    public void queryRootByUsernameAndPassword() {
        Root root = rootDao.queryRootByUsernameAndPassword("root", "root");
        System.out.println(root);
    }

    @Test
    public void queryRootByUsername() {
        Root root = rootDao.queryRootByUsername("root");
        System.out.println(root);
    }
}