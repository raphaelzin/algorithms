//
// 739. Daily Temperatures.swift
// Created by Raphael Souza on 2021-05-18.

// [73, 74, 75, 71, 69, 72, 76, 73]
// [1, 1, 4, 2, 1, 1, 0, 0]

class Solution {
	func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
		var ans = Array(repeating: 0, count: temperatures.count)
		var stack: [Int] = []
		
		var i = temperatures.count-1
		while i >= 0 {
			while !stack.isEmpty && temperatures[stack[stack.count-1]] <= temperatures[i] {
				_ = stack.removeLast()
			}
			
			ans[i] = stack.isEmpty ? 0 : stack[stack.count-1] - i
			stack.append(i)
			i -= 1
		}
		
		return ans
	}
}

let solution = Solution()
print(solution.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))
