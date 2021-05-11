//
// 15. 3Sum.swift
// Created by Raphael Souza on 2021-03-23.

import Foundation

class Solution {
	func threeSum(_ nums: [Int]) -> [[Int]] {
		let arr = nums.sorted()
		var solutions: [[Int]] = []
		var i = 0
		
		while i < arr.count-2 {
			if (0 == i) || (i > 0 && arr[i] != arr[i-1]) {
				
				var low = i + 1
				var high = arr.count-1
				let sum = -arr[i]
				
				while low < high {
					if arr[low] + arr[high] == sum {
						solutions.append([arr[i], arr[low], arr[high]])
						while low < high && arr[low] == arr[low+1] { low += 1 }
						while low < high && arr[high] == arr[high-1] { high -= 1 }
						high -= 1
						low += 1
					} else if arr[low] + arr[high] > sum {
						high -= 1
					} else {
						low += 1
					}
				}
			}
			
			i += 1
		}
		
		return solutions
	}
}


let sol = Solution()
print(sol.threeSum([-1,0,1,2,-1,-4]))