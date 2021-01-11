package com.tangjia.service;

import com.tangjia.pojo.Root;

public interface RootService {
    public Root register(String username,String password);

    public Root queryByUsername(String username);

    public int addRoot(Root root);


}
