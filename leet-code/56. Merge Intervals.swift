//
// 56. Merge Intervals.swift
// Created by Raphael Souza on 2021-04-18.

import Foundation

class Solution {
	func merge(_ intervals: [[Int]]) -> [[Int]] {
		let sIntervals = intervals.sorted(by: { $0[0] < $1[0] })
		var ans = [sIntervals[0]]
		
		for i in sIntervals[1...] {
			let ansLast = ans[ans.count-1]
			
			if ansLast[1] >= i[0] {
				ans[ans.count-1] = [min(ansLast[0], i[0]), max(ansLast[1], i[1])]
			} else {
				ans.append(i)
			}
		}
		
		return ans
	}
}

print(Solution().merge([[1,3],[2,6],[8,10],[15,18]]))
print(Solution().merge([[1,4],[4,5]]))
print(Solution().merge([[1,4],[0,0]]))
