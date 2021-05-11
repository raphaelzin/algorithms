//
// 461. Hamming Distance.swift
// Created by Raphael Souza on 2021-03-23.

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xor = (x^y)
        var r = 0
        
        while xor > 0 {
            r += xor & 1
            xor = xor >> 1
        }
        
        return r
    }
}

let sol = Solution()
print(sol.hammingDistance(1,4))