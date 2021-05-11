//
// 977. Squares of a Sorted Array.swift
// Created by Raphael Souza on 2021-05-10.


class Solution {
	func sortedSquares(nums: [Int]) -> [Int] {
		guard let index = nums.firstIndex(where: { $0 >= 0 }) else {
			return nums.reversed().map { $0*$0 }
		}
		var ans: [Int] = []
		
		var nIndex = index-1
		var pIndex = index
		
		while pIndex < nums.count && nIndex >= 0 {
			if -nums[nIndex] < nums[pIndex] {
				ans.append(-nums[nIndex])
				nIndex -= 1
			} else {
				ans.append(nums[pIndex])
				pIndex += 1
			}
		}
		
		if pIndex == nums.count {
			return (ans + nums[0..<nIndex+1].reversed()).map { $0 * $0 }
		} else {
			return (ans + nums[pIndex...]).map { $0 * $0 }
		}
	}
}
let solution = Solution()

print(solution.sortedSquares(nums: [-4,-1,0,3,10]))
print(solution.sortedSquares(nums: [-1,0,1]))
print(solution.sortedSquares(nums: [36]))