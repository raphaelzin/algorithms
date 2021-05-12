//
// 76. Minimum Window Substring.swift
// Created by Raphael Souza on 2021-05-11.

class Solution {
	func minWindow(_ s: String, _ t: String) -> String {
		var tDict: [Character: Int] = [:]
		
		for c in t {
			tDict[c] = (tDict[c] != nil) ? tDict[c]!+1 : 1
		}
		
		var left = -1
		var i = 0
		var ansSize = Int.max
		var ansStartIndex = 0
		
		let source = Array(s)
		
		while i < source.count {
			guard tDict[source[i]] != nil else {
				i += 1
				continue
			}
			
			if left == -1 {
				left = i
			}
			if source[left] == source[i] && tDict[source[i]] == 0 {
				left += 1
				while (tDict[source[left]] ?? -1) < 0 {
					if let cCount = tDict[source[left]] {
						if cCount < 0 {
							tDict[source[left]]! += 1
							left += 1
							continue
						} else if cCount == 0 {
							break
						}
					} else {
						left += 1
					}
				}
			} else {
				tDict[source[i]]! -= 1
			}
			
			if (ansSize != .max || tDict.values.allSatisfy({ $0 < 1 })) && (ansSize > i-left) {
				ansSize = i-left
				ansStartIndex = left
			}
			
			i += 1
		}
		
		return ansSize == .max ? "" : String(source[ansStartIndex...(ansStartIndex+ansSize)])
	}
}