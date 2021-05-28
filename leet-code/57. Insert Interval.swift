//
// 57. Insert Interval.swift
// Created by Raphael Souza on 2021-05-26.

class Solution {
	func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
		guard !intervals.isEmpty else { return [newInterval] }
		var ans: [[Int]] = []
		
		var i = 0
		
		while i < intervals.count && (intervals[i][1] < newInterval[0]) {
			ans.append(intervals[i])
			i += 1
		}
		
		if intervals.count <= i || intervals[i][0] > newInterval[1]{
			ans.append(newInterval)
		} else {
			let newIntervalMinLeft = min(newInterval[0], intervals[i][0])
			
			while i < intervals.count && newInterval[1] > intervals[i][1] {
				i += 1
			}
			
			if i >= intervals.count || newInterval[1] < intervals[i][0] {
				ans.append([newIntervalMinLeft, newInterval[1]])
			} else {
				ans.append([newIntervalMinLeft, intervals[i][1]])
				i += 1
			}
		}
		
		while i < intervals.count {
			ans.append(intervals[i])
			i += 1
		}
		
		return ans
	}
}