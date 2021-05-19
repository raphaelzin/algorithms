//
// 217. Contains Duplicate.swift
// Created by Raphael Souza on 2021-05-18.

class Solution {
	func containsDuplicate(_ nums: [Int]) -> Bool {
		Set(nums).count != nums.count
	}
}