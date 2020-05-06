#!/usr/local/bin/lua

--[[
  Lua 协同程序(coroutine)
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

-- 重启 coroutine
coroutine.resume(co, 1, 2)
print(coroutine.status(co))  -- dead

-- 创建 coroutine，返回一个函数，一旦你调用这个函数，就进入 coroutine，和 create 功能重复
co2 = coroutine.wrap(
    function(i)
        print(i);
    end
)
co2(1)

-- 挂起 coroutine，将 coroutine 设置为挂起状态
coroutine.yield()

-- 返回正在跑的 coroutine，一个 coroutine 就是一个线程，当使用running的时候，就是返回一个 corouting 的线程号
print(coroutine.running())
