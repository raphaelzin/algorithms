//
// 268. Missing Number.swift
// Created by Raphael Souza on 2021-05-11.

class Solution {
	func missingNumber(_ nums: [Int]) -> Int {
		let sum = nums.reduce(0,+)
		let total = ((1+nums.count))*nums.count/2
		return total - sum
	}
}

let solution = Solution()
print(solution.missingNumber([3,0,1]))
