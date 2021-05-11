//
// 16. 3Sum Closest.swift
// Created by Raphael Souza on 2021-03-26.

import Foundation

class Solution {
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		let snums = nums.sorted()
		var bsf = snums[0] + snums[1] + snums[2]
		
		for i in 0..<snums.count-2 {
			var lower = i+1
			var higher = snums.count-1
			
			while lower < higher {
				let currentSum = snums[i] + snums[lower] + snums[higher]
				if currentSum == target { 
					return target
				}
				
				if abs(target-currentSum) < abs(target-bsf) {
					bsf = currentSum
				}
				
				if currentSum > target {
					higher -= 1
				} else {
					lower += 1
				}
			}
		}
		return bsf
	}
}


let solution = Solution()

//print(solution.threeSumClosest([-1,2,1,-4], 1))
//print(solution.threeSumClosest([0,1,2], 3))

//print(solution.threeSumClosest([1,1,1,1], -100))
print(solution.threeSumClosest([1,1,1,0], -100))