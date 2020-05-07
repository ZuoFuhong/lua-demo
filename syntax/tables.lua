#!/usr/local/bin/lua

--[[
  Lua table(表)
  table 是 Lua 的一种数据结构用来帮助我们创建不同的数据类型，如：数组、字典等。
  Lua table 使用关联型数组，你可以用任意类型的值来作数组的索引，但这个值不能是 nil。
  Lua table 是不固定大小的，你可以根据自己需要进行扩容。
]]

-- 初始化Table
tab0 = {name="dazuo", age=20, 100, 200}
for k, v in pairs(tab0) do
  print(k .. " : " .. v)
end
print(tab0["name"])
print(tab0[1])

print("----------------")

local tab1 = {}
tab1["key"] = "value"
key = 10
tab1[key] = 22
for k, v in pairs(tab1) do
  print(k .. " : " .. v)
end
-- 移除引用，lua 垃圾回收会释放内存
tab1=nil
print("tab1: ", tab1)

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
-- 对给定的table进行升序排序
table.sort(tab2)

for k, v in pairs(tab2) do
  print(k .. " : " .. v)
end

-- tab3 和 tab2 指向同一块内存
tab3 = tab2
tab3[1] = "apple1"
print(tab2[1])
