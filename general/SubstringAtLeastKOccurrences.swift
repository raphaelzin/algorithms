//
// Substring.swift
// Created by Raphael Souza on 2021-06-02.

func substring(_ s: String, _ k: Int) -> Int {
	if k > s.count { return 0 }
	if k == 0 && k == 1 { return s.count }
	
	let str = Array(s)

	var cCount = Array(repeating: 0, count: 26)	
	for c in str {
		let cIndex = Int(c.asciiValue! - ("a" as Character).asciiValue!)
		cCount[cIndex] += 1
	}
	
	var char: Character = "."
	
	for i in cCount {
		if cCount[i] < k && cCount[i] > 0 {
			let unicode = Int(("a" as Character).asciiValue!) + i
			char = Character(Unicode.Scalar(unicode)!)
			break
		}
	}
	
	if char == "." { return str.count }
	
	let splitStrings = split(String(str), char: char)
	var ans = 0
	
	for splitString in splitStrings {
		ans = max(ans, substring(String(splitString), k))
	}
	
	return ans
}

func split(_ s: String, char: Character) -> [String] {
	var strs: [String] = []
	var currStr: [Character] = []
	
	for c in s {
		if c == char {
			if !currStr.isEmpty {
				strs.append(String(currStr))
				currStr = []
			}
		} else {
			currStr.append(c)
		}
	}
	
	return strs
}

print(substring("ababbc", 2))