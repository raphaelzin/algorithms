//
// 5. Longest Palindromic Substring.swift
// Created by Raphael Souza on 2021-03-28.

import Foundation

class Solution {
	func longestPalindrome(_ s: String) -> String {
		let ns = Array(s)
	
		if s.count < 2 { return s }
		
		
		var maxLengh = 0
		var bestStartIndex = 0
		
		var index = 0
		
		while index < ns.count {
			var radius = 0

			while (index - radius - 1) >= 0 && (index + radius + 1) < ns.count
			&& ns[index - radius - 1] == ns[index + radius + 1] {
				radius += 1
				
				if maxLengh < radius*2 + 1 {
					maxLengh = radius*2 + 1
					bestStartIndex = index - radius
				}
			}
			
			radius = 0
			while (index - radius) >= 0 && (index + radius + 1) < ns.count
			&& ns[index - radius] == ns[index + radius + 1] {
				radius += 1
				
				if maxLengh < radius*2 {
					maxLengh = radius*2
					bestStartIndex = index - radius + 1
				}
			}
			
			index += 1
		}
		
		if maxLengh == 0 {
			return String(s.first!)
		}

		return String(ns[bestStartIndex..<(bestStartIndex+maxLengh)])
	}
}


let sol = Solution()
//print(sol.longestPalindrome("babad"))
print(sol.longestPalindrome("cbbd"))
//print(sol.longestPalindrome("a"))
//print(sol.longestPalindrome("ac"))
