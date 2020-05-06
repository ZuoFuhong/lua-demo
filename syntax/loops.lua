#!/usr/local/bin/lua

num = 5
while( num > 0 )
do
  num = num - 1
  print(num)
end

-- 数值for循环
for i = 5, 10 do
  print("i" .. i)
  if (i == 8)
  then
    break
  end
end

-- 泛型for循环
-- ipairs是Lua提供的一个迭代器函数，用来迭代数组。
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end 

-- Lua goto 语句
-- Lua 语言中的 goto 语句允许将控制流程无条件地转到被标记的语句处。
for i=1, 3 do
  if i <= 2 then
      print(i, "yes continue")
      goto continue
  end
  print(i, " no continue")
  ::continue::
  print([[i'm end]])
end
