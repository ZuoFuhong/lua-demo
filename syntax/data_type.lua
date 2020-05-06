#!/usr/local/bin/lua

--[[
  Lua数据类型
  Lua 是动态类型语言，变量不要类型定义,只需要为变量赋值。 值可以存储在变量中，作为参数传递或结果返回。
  Lua 中有 8 个基本类型分别为：nil、boolean、number、string、userdata、function、thread 和 table。

  数据类型	 描述
  nil	      这个最简单，只有值nil属于该类，表示一个无效值（在条件表达式中相当于false）。
  boolean	  包含两个值：false和true。
  number	  表示双精度类型的实浮点数
  string	  字符串由一对双引号或单引号来表示
  function	由 C 或 Lua 编写的函数
  userdata	表示任意存储在变量中的C数据结构
  thread	  表示执行的独立线路，用于执行协同程序
  table	    Lua中的表（table）其实是一个"关联数组"（associative arrays），数组的索引可以是数字、字符串或表类型。
            在Lua里，table的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。
]]

print(type(nil))                -- nil
print(type(true))               -- boolean
print(type(10.4 * 3))           -- number
print(type("Hello world"))      -- string
print(type(print))              -- function
print(type(type))               -- function

-- Lua会尝试将这个字符串转换为一个数字
print("2" + 6)
-- 字符串连接使用的是 ..
print("name:" .. "dazuo")
-- 使用 # 来计算字符串的长度
print(#"age:20")

-- table表
local tab1 = {}
tab1["key"] = "value"
key = 10
tab1[key] = 22
for k, v in pairs(tab1) do
  print(k .. " : " .. v)
end

-- Lua 里表的默认初始索引一般以 1 开始
-- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil。
local tab2 = {"apple", "pear", "orange", "grape"}
print(tab2[1])
-- 指定的字符连接元素
print(table.concat(tab2, "-"))
-- 尾部插入元素
table.insert(tab2, "banana")
-- 移除尾部元素
table.remove(tab2)

for k, v in pairs(tab2) do
  print(k .. " : " .. v)
end
