//
// 49. Group Anagrams.swift
// Created by Raphael Souza on 2021-05-02.

import Foundation

class Solution {
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		var dict: [String: [String]] = [:]
		var count: [Int] = Array(repeating: 0, count: 26)
		var id: String = ""
		
		for word in strs {
			for c in word {
				let index = Int(c.asciiValue! - ("a" as Character).asciiValue!)
				count[index] += 1
			}
			
			for cCount in count {
				id.append("#")
				id.append("\(cCount)")
			}
			
			if dict[id] != nil {
				dict[id]!.append(word)
			} else {
				dict[id] = [word]
			}
			
			id = ""
			for i in 0..<count.count {
				count[i] = 0
			}
		}
		
		return Array(dict.values)
	}
}
let solution = Solution()

print(solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
