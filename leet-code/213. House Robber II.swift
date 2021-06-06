//
// 213. House Robber II.swift
// Created by Raphael Souza on 2021-05-29.

class Solution {
	func rob(_ nums: [Int]) -> Int {
		guard nums.count > 1 else { return nums[0] }
		return max(rob(nums,1,nums.count), rob(nums, 0, nums.count-1))
	}
	
	func rob(_ nums: [Int],_ lo: Int,_ hi: Int) -> Int {
		if hi-lo < 3 { return nums[lo..<hi].max() ?? 0 }
		if hi-lo == 3 { return [nums[lo+1], nums[lo]+nums[lo+2]].max()! }
		
		var prev_0 = nums[lo]
		var prev_1 = nums[lo+1]
		var prev_2 = nums[lo+2] + nums[lo]
		
		for i in lo+3..<hi {
			let new_prev = max(prev_0, prev_1) + nums[i]
			
			prev_0 = prev_1
			prev_1 = prev_2
			prev_2 = new_prev
		}
		
		return max(prev_2, prev_1)
	}
}

let sol = Solution()
print(sol.rob([1]))