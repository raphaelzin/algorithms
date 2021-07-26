//
// 45. Jump Game II.swift
// Created by Raphael Souza on 2021-07-26.

//[max, max, max, max, max]
//[2,3,1,1,4]
//

class Solution {
	func jump(_ nums: [Int]) -> Int {
		var curFarthest = 0, curEnd = 0, jumps = 0
		
		for i in 0..<nums.count-1 {
			curFarthest = max(nums[i]+i, curFarthest)
			
			if curEnd == i {
				jumps += 1
				curEnd = curFarthest
			}
		}
		return jumps
	}
}

let sol = Solution()
print(sol.jump([2,3,1,1,4]))