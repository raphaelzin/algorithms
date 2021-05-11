//
// 136. Single Number
// Created by Raphael Souza on 2021-04-16.

import Foundation

class Solution {
	func singleNumber(_ nums: [Int]) -> Int {
		var a = 0
		for i in nums {
			a ^= i
		}
		return a
	}
}

print(Solution().singleNumber([4,1,2,1,2]))
print(Solution().singleNumber([2,2,1]))