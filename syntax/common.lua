#!/usr/local/bin/lua

-- 定义一个名为 module 的模块
module = {}

-- 定义一个常量
module.constant = "这是一个常量"

local function func1()
  print("这是一个私有函数！")
end

function module.func2()
  func1()
end

return module