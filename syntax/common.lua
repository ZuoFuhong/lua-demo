#!/usr/local/bin/lua

-- 定义一个名为 module 的模块
_M = {}

-- 定义一个常量
_M.constant = "这是一个常量"

function func1()
  print("func1 这是一个私有函数！")
end

function _M.func2()
  func1()
end

-- 函数定义改成冒号，就可以省略self参数；调用的时候冒号默认传递调用者自己为参数
function _M:func3()
  print("func3 constant：", self.constant)
end

return _M