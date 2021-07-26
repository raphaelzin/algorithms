//
// 647. Palindromic Substrings.swift
// Created by Raphael Souza on 2021-07-24.

class Solution {
	func countSubstrings(_ s: String) -> Int {
		var count = s.count
		let cs = Array(s)
		
		for i in 1..<cs.count {
			count += palindromes(from: cs, i-1, i)
			
			count += palindromes(from: cs, i-1, i+1)
		}
		
		return count
	}
	
	private func palindromes(from s: [Character], _ left: Int, _ right: Int) -> Int {
		var l = left
		var r = right
		
		var palindromes = 0
		
		while l >= 0 && r < s.count {
			if s[l] == s[r] {
				palindromes += 1
			} else {
				break
			}
			
			l -= 1
			r += 1
		}
		
		return palindromes
	}
}