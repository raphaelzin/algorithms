//
// 1249. Minimum Remove to Make Valid Parentheses.swift
// Created by Raphael Souza on 2021-04-19.

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var str = Array(s)
        var i = 0
        var stack: [Character] = []
        var indexes: [Int] = []
        
        while i < str.count {
            if str[i] == "(" {
                stack.append("(")
                indexes.append(i)
            } else if str[i] == ")" {
                if stack.last == "(" {
                    stack.removeLast()
                    indexes.removeLast()
                } else {
                    str.remove(at: i)
                    continue
                }
            }
            i += 1
        }
        
        for index in indexes.reversed() {
            str.remove(at: index)
        }
        
        return String(str)
    }
}

print(Solution().minRemoveToMakeValid("lee(t(c)o)de)"))
print(Solution().minRemoveToMakeValid("a)b(c)d"))
print(Solution().minRemoveToMakeValid("))(("))
print(Solution().minRemoveToMakeValid("(a(b(c)d)"))