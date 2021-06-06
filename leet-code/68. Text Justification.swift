//
// 68. Text Justification.swift
// Created by Raphael Souza on 2021-06-05.

class Solution {
	func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
		var ans: [String] = []
		var wordsTaken = 0
		
		while wordsTaken != words.count {
			let nextLine = getNextLine(from: Array(words[wordsTaken...]), maxWidth)
			ans.append(nextLine.line)
			wordsTaken += nextLine.wordsTaken
		}
		
		return ans
	}
	
	func getNextLine(from words: [String], _ maxWidth: Int) -> (line: String, wordsTaken: Int) {
		var wordsTaken = 0
		var currentWidth = 0
		
		while (currentWidth <= maxWidth) && (wordsTaken < words.count) {
			let extraSpace = wordsTaken == 0 ? 0 : 1
			
			if (currentWidth + words[wordsTaken].count + extraSpace) > maxWidth {
				break
			}
			currentWidth += words[wordsTaken].count + extraSpace
			wordsTaken += 1
		}
		
		if wordsTaken == 1 {
			let remainingSpaces = maxWidth - words[0].count
			let spaces = String(repeating: " ", count: remainingSpaces)
			return (words[0] + spaces, 1)
		}
		
		if words.count == wordsTaken {
			let joinedWords = words.joined(separator: " ")
			let remainingSpaces = maxWidth - joinedWords.count
			let spaces = String(repeating: " ", count: remainingSpaces)
			
			
			return (joinedWords + spaces, words.count)
		}
		
		let extraSpaces = maxWidth - currentWidth
		let spaceGaps = wordsTaken-1
		
		let lastLineGaps = extraSpaces%spaceGaps
		let commonExtraSpaces = extraSpaces/spaceGaps
		
		var finalString = ""
		
		for i in 0..<wordsTaken {
			if i == wordsTaken-1 {
				finalString.append(contentsOf: words[i])
			} else {
				let numberOfSpaces = commonExtraSpaces + ((i < lastLineGaps) ? 1 : 0)
				let spacesString = String(repeating: " ", count: numberOfSpaces + 1)
				finalString.append(contentsOf: words[i] + spacesString)
			}
		}
		
		return (finalString, wordsTaken)
	}
}


let sol = Solution()
var arr = ["Listen","to","many,","speak","to","a","few."]
print(sol.fullJustify(arr, 6))