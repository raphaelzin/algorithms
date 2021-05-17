//
// 198. House Robber.swift
// Created by Raphael Souza on 2021-05-14.

class Solution {
	func rob(_ nums: [Int]) -> Int {
		guard nums.count > 1 else { return nums.first ?? 0 }
		var dp = Array(repeating: 0, count: nums.count)
		dp[0] = nums[0]
		dp[1] = nums[1]
		
		if nums.count > 2 {
			dp[2] = nums[0] + nums[2]
		} else {
			return max(dp[nums.count-2], dp[nums.count-1])
		}
		
		for i in 3..<nums.count {
			dp[i] = max(dp[i-2], dp[i-3]) + nums[i]
		}
		
		return max(dp[nums.count-2], dp[nums.count-1])
	}
}

let solution = Solution()
print(solution.rob([1,2,3,1,1,6]))
print(solution.rob([1,2,3,1]))