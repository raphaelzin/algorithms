//
// 55. Jump Game.swift
// Created by Raphael Souza on 2021-04-21.

class Solution {
	func canJump(_ nums: [Int]) -> Bool {
		var steps = nums[0]
		var index = 0
		
		while steps > 0 {
			index += 1
			if index == nums.count-1 {
				return true
			}
			
			steps -= 1
			steps = max(nums[index], steps)
		}
		return index >= nums.count-1
	}
}

let solution = Solution()
print(solution.canJump([2,3,1,1,4]))
print(solution.canJump([3,2,1,0,4]))
