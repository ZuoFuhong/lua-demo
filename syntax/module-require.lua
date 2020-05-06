#!/usr/local/bin/lua

--[[
  Lua 模块与包
  Lua 的模块是由变量、函数等已知元素组成的 table，因此创建一个模块很简单，就是创建一个 table，然后把需要导出的常量、函数放入其中，最后返回这个 table 就行。

  require加载机制
  require 用于搜索 Lua 文件的路径是存放在全局变量 package.path 中，当 Lua 启动后，会以环境变量 LUA_PATH 的值来初始这个环境变量。如果没有找到该环境变量，
  则使用一个编译时定义的默认路径来初始化。

  当然，如果没有 LUA_PATH 这个环境变量，也可以自定义设置，在当前用户根目录下打开 .profile 文件（没有则创建，打开 .bashrc 文件也可以），例如把 "~/lua/" 
  路径加入 LUA_PATH 环境变量里：
]]

--[[
print(package.path);

/usr/local/share/lua/5.3/?.lua;
/usr/local/share/lua/5.3/?/init.lua;
/usr/local/lib/lua/5.3/?.lua;
/usr/local/lib/lua/5.3/?/init.lua;
./?.lua;
./?/init.lua
]]

-- 添加模块路径（绝对路径）
-- package.path = package.path ..';/Users/dazuo/workplace/lua-demo/syntax/?.lua';
-- local m = require("common")
-- print(m.constant)

-- 添加模块路径（相对路径）
-- package.path = package.path ..';./syntax/?.lua';
-- local m = require("common")
-- print(m.constant)

-- 加载一个模块（相对路径）
local m = require("syntax.common")
print(m.constant)
m.func2()

require("lfs")
path=lfs.currentdir()
print("当前路径：", path)