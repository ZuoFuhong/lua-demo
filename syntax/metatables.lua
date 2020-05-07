#!/usr/local/bin/lua

--[[
  Lua 元表(Metatable)

  两个很重要的函数来处理元表：
  - setmetatable(table,metatable): 对指定 table 设置元表(metatable)，如果元表(metatable)中存在 __metatable 键值，setmetatable 会失败。
  - getmetatable(table): 返回对象的元表(metatable)
]]

mytable = {}                          -- 普通表

other = { age = 20 }
mymetatable = {name="dazuo", __index=other}          -- 元表
tmpTab = setmetatable(mytable, mymetatable)   -- 把 mymetatable 设为 mytable 的元表
-- 返回值是 普通表
print(tmpTab == mytable)

res = getmetatable(mytable)                 -- 这将返回mymetatable
print("name: ", res["name"])

--[[
  __index 元方法

  这是 metatable 最常用的键。
  当你通过键来访问 table 的时候，如果这个键没有值，那么Lua就会寻找该table的metatable（假定有metatable）中的__index 键。如果__index包含一个表格，
  Lua会在表格中查找相应的键。
]]
print("age: ", mytable["age"])

--[[
  如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数。
  __index 元方法查看表中元素是否存在，如果不存在，返回结果为 nil；如果存在则由 __index 返回结果。
]]
mymetatable["__index"] = function (mytable, key)
  return "func: " .. key
end
print(mytable["key123"])

print("----- __newindex --------")

--[[
  __newindex 元方法
  
  __newindex 元方法用来对表更新，__index则用来对表访问 。
  当你给表的一个缺少的索引赋值，解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。
]]

mymetatable2 = {}
mytable2 = setmetatable({key1 = "value1"}, { __newindex = mymetatable2 })
print(mytable2.key1)
mytable2.key2="value2"
print(mytable2.key2, mymetatable2.key2)

mytable2.key1="value11"
print(mytable2.key1, mymetatable2.key1)

--[[
  以上实例中表设置了元方法 __newindex，
  在对新索引键（key2）赋值时（mytable.key2 = "value2"），会调用元方法，而不进行赋值。而如果对已存在的索引键（key1），则会进行赋值，而不调用元方法 __newindex。
]]

print("----- __call --------")

--[[
  __call 元方法在 Lua 调用一个值时调用
]]

-- 定义元方法__call
mytable3 = setmetatable({10}, {
  __call = function(mytable, a)
    print('mytable: ', mytable[1], "a: ", a)
  end
})
mytable3(99)

print("----- __tostring --------")

--[[
  __tostring 元方法用于修改表的输出行为。
]]
mytable4 = setmetatable({ 10, 20, 30 }, {
  __tostring = function(mytable)
    sum = 0
    for k, v in pairs(mytable) do
                sum = sum + v
        end
    return "表所有元素的和为 " .. sum
  end
})
print(mytable4)