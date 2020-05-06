#!/usr/local/bin/lua

--[[
  Lua 文件 I/O
  Lua I/O 库用于读取和处理文件。分为简单模式（和C一样）、完全模式。
  - 简单模式（simple model）拥有一个当前输入文件和一个当前输出文件，并且提供针对这些文件相关的操作。
  - 完全模式（complete model） 使用外部的文件句柄来实现。它以一种面对对象的形式，将所有的文件操作定义为文件句柄的方法

  简单模式在做一些简单的文件操作时较为合适。但是在进行一些高级的文件操作的时候，简单模式就显得力不从心。例如同时读取多个文件这样的操作，使用完全模式则较为合适。
]]
require("lfs")
path=lfs.currentdir()
print("当前路径：", path)

file = io.open("../README.md", "r")
io.input(file)

-- 读取第一行
print(io.read())
io.close(file)