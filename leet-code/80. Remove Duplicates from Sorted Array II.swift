//
// 80. Remove Duplicates from Sorted Array II.swift
// Created by Raphael Souza on 2021-05-28.

class Solution {
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		guard nums.count > 2 else { return nums.count }
		var i: Int = 2
		
		while i < nums.count {
			if nums[i-2] == nums[i] {
				nums.remove(at: i)
			} else {
				i += 1
			}
		}
		
		return i
	}
}