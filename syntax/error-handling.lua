#!/usr/local/bin/lua

-- Lua 错误处理

-- assert函数：首先检查第一个参数，若没问题，assert不做任何事情；否则，assert以第二个参数作为错误信息抛出。
local function add(a,b)
  assert(type(a) == "number", "a 不是一个数字")
  assert(type(b) == "number", "b 不是一个数字")
  return a+b
end
-- add(10)

-- error函数：终止正在执行的函数，并返回message的内容作为错误信息(error函数永远都不会返回)
local function reduce()
  print("reduce begin")
  error("reduce error")
  print("reduce end")
end
-- reduce()

-- pcall接收一个函数和要传递给后者的参数，并执行，执行结果：有错误、无错误；返回值true或者或false, errorinfo。
res=pcall(function(i) print(i) end, 33)
print(res)

-- Lua提供了xpcall函数，xpcall接收第二个参数——一个错误处理函数，当错误发生时，Lua会在调用桟展开（unwind）前调用错误处理函数，
-- 于是就可以在这个函数中使用debug库来获取关于错误的额外信息了。
function myfunction ()
  n = n/nil
end

function myerrorhandler( err )
  print( "ERROR:", err )

  -- 输出：返回调用栈的栈回溯信息
  print(debug.traceback())
end

status = xpcall( myfunction, myerrorhandler )
print( status)

