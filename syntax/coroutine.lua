#!/usr/local/bin/lua

--[[
  Lua 协同程序(coroutine)与线程比较类似：拥有独立的堆栈，独立的局部变量，独立的指令指针，同时又与其它协同程序共享全局变量和其它大部分东西。

  线程和协同程序区别
  线程与协同程序的主要区别在于，一个具有多个线程的程序可以同时运行几个线程，而协同程序却需要彼此协作的运行。
  在任一指定时刻只有一个协同程序在运行，并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起。
  协同程序有点类似同步的多线程，在等待同一个线程锁的几个线程有点类似协同。
]]

-- 创建 coroutine，返回 coroutine， 参数是一个函数，当和 resume 配合使用的时候就唤醒函数调用
co = coroutine.create(
  function (a, b)
    print(a, b)
  end
)

-- 调用resume，将协同程序唤醒,resume操作成功返回true，否则返回false；
coroutine.resume(co, 1, 2)

-- 查看 coroutine 的状态
-- 注：coroutine 的状态有三种：dead，suspended，running
print(coroutine.status(co))  -- dead

-- 创建 coroutine，返回一个函数，一旦你调用这个函数，就进入 coroutine，和 create 功能重复
co2 = coroutine.wrap(
    function(i)
        print(i);
    end
)
co2(1)

print("--------------")

co2 = coroutine.create(
  function()
    for i=1,10 do
        print(i)
        if i == 3 then
            print("co2: ", coroutine.status(co2))  --running
            print("co2: ", coroutine.running()) --thread:XXXXXX
        end
        -- 挂起正在跑的 coroutine，将 coroutine 设置为挂起状态
        coroutine.yield()
    end
  end
)
-- 当使用resume触发事件的时候，create的coroutine函数就被执行了
-- 当遇到yield的时候就代表挂起当前线程，等候再次resume触发事件。
coroutine.resume(co2) --1
-- 第二次resume，再次唤醒协同程序
coroutine.resume(co2) --2
coroutine.resume(co2) --3

-- 返回正在跑的 coroutine，一个 coroutine 就是一个线程，当使用running的时候，就是返回一个 corouting 的线程号
print(coroutine.running())
