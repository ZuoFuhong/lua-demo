#!/usr/local/bin/lua

str1="my name is 大左"
-- 转大写
print(string.upper(str1))
-- 计算字符串长度（注意中文字符长度）
print(string.len(str1))
print(#str1)

-- 格式化
print(string.format("name: %s, age = %d", "dazuo", 24))