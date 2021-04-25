//
// 696. Count Binary Substrings.swift
// Created by Raphael Souza on 2021-04-23.

class Solution {
	func countBinarySubstrings(_ s: String) -> Int {
		var currentGroupSize = 1
		var prevGroupSize = 0
		var ans = 0
		let str = Array(s)
		
		for i in 0..<str.count-1 {
			
			if str[i] == str[i+1] {
				currentGroupSize += 1
			} else {
				ans += min(currentGroupSize, prevGroupSize)
				prevGroupSize = currentGroupSize
				currentGroupSize = 1
			}
		}
		
		if currentGroupSize != 0 {
			ans += min(currentGroupSize, prevGroupSize)
		} else {
			ans += 1
		}
		
		return ans
	}
}

let solution = Solution()
print(solution.countBinarySubstrings("00110"))
print(solution.countBinarySubstrings("00110011"))
