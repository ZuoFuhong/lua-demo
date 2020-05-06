#!/usr/local/bin/lua

--[[
  Lua流程控制
  控制结构的条件表达式结果可以是任何值，Lua认为false和nil为假，true和非nil为真。
]]

if(0)
then
  print("0 为 true")
end

a=2
if(a == 0)
then
  print("a = 0")
elseif(a > 2)
then
  print("a 大于 0")
else
  --[ 布尔表达式为 false 时执行该语句块 --]
end