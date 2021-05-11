//
// 46. Permutations.swift
// Created by Raphael Souza on 2021-04-16.

import Foundation

class Solution {
	func permute(_ nums: [Int]) -> [[Int]] {
		var answers: [[Int]] = []
		var nums2 = nums
		var current: [Int] = []
		recursivePermute(&nums2, currentAns: &current, answers: &answers)
		return answers
	}
	
	func recursivePermute(_ nums: inout [Int], currentAns: inout [Int], answers: inout [[Int]]) {
		if nums.isEmpty { answers.append(currentAns); return }
		for i in 0..<nums.count {
			currentAns.append(nums[i])
			nums.remove(at: i)
			recursivePermute(&nums, currentAns: &currentAns, answers: &answers)
			nums.insert(currentAns.removeLast(), at: i)
		}
	}
}

print(Solution().permute([1,2,3]))