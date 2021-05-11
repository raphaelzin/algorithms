//
// 39. Combination Sum.swift
// Created by Raphael Souza on 2021-05-02.

import Foundation

class Solution {
	func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
		var sol: [[Int]] = []
		combine(candidates, 0, [], target, &sol)
		return sol
	}
	
	private func combine(_ candidates: [Int], _ i: Int , _ selected: [Int], _ target: Int, _ solutions: inout [[Int]]) {
		if target == 0 || i == candidates.count{
			solutions.append(selected)
			return
		}
		
		if target < 0 {
			return
		}
		
		for index in i..<candidates.count {
			let item = candidates[index]
			combine(candidates, index, selected + [item], target-item, &solutions)
		}
	}
}

let solution = Solution()
print(solution.combinationSum([2,3,5], 8))