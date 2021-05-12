//
// 242. Valid Anagram
// Created by Raphael Souza on 2021-05-11.

class Solution {
	func isAnagram(_ s: String, _ t: String) -> Bool {
		guard s.count == t.count else { return false }
		var dict: [Character: Int] = [:]
		
		for c in s {
			dict[c] = dict[c] != nil ? (dict[c]! + 1) : 1
		}
		
		for c in t {
			if dict[c] == nil {
				return false
			}
			dict[c]! -= 1
		}
		
		return dict.values.allSatisfy({ $0 == 0 })
	}
}