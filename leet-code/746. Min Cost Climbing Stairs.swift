//
// 746. Min Cost Climbing Stairs.swift
// Created by Raphael Souza on 2021-04-15.

import Foundation

// 0 [1,100,1,1,1,100,1,1,100,1]
// 0  1 100 2 3 3 100



class Solution {
	func minCostClimbingStairs(_ cost: [Int]) -> Int {
		var prev = cost[1]
		var beforePrev = cost[0]
		var currentCost = 0
		
		for i in 2..<cost.count {
			currentCost = cost[i] + min(prev, beforePrev)
			beforePrev = prev
			prev = currentCost
		}
		
		return min(prev, beforePrev)
	}
}

let sol = Solution()
print(sol.minCostClimbingStairs([10,15,20]))
print(sol.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))
//print(sol.minCostClimbingStairs([10,15,20]))

