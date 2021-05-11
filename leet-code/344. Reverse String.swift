//
// 344. Reverse String.swift
// Created by Raphael Souza on 2021-04-16.

import Foundation

class Solution {
	func reverseString(_ s: inout [Character]) {
		for i in 0..<s.count/2 {
			s.swapAt(i, s.count-1-i)
		}
	}
}

var s = Array("hello")
Solution().reverseString(&s)
print(s)