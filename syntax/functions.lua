#!/usr/local/bin/lua

-- function函数
function contact(a, b)
  return a .. b
end
print(contact("abc", "efg"))

-- 匿名函数
function anonymousFunc(a, fun)
  print(fun(a));
end

anonymousFunc(
  "a1",
  function(a)
    return a
  end
)

-- 多返回值
function mulFunc()
  return 12, 23
end
c, d = mulFunc()
print(c, d)

-- 可变参数
-- Lua 函数可以接受可变数目的参数，和 C 语言类似，在函数参数列表中使用三点 ... 表示函数有可变的参数。
function add(...)  
  local s = 0  
  for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end
  return s  
end
print(add(3,4,5,6,7))  --->25