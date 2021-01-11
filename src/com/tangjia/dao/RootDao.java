package com.tangjia.dao;

import com.tangjia.pojo.Root;
import com.tangjia.pojo.User;

public interface RootDao {
    public int addRoot(Root root);

    public Root queryRootByUsernameAndPassword(String username, String password);

    public Root queryRootByUsername(String username);

}
