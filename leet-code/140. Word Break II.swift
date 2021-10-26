//
// 140. Word Break II
// Created by Raphael Souza on 2021-10-25.

class Solution {
	class TrieTree {
		class Node {
			var children: [Character: Node] = [:]
			var isWord: Bool = false
		}
		
		private var root: Node = Node()
		
		func add(_ dictionary: [String]) {
			dictionary.forEach(add(_:))
		}
		
		func add(_ word: String) {
			var node = root
			
			for c in word {
				if let _node = node.children[c] {
					node = _node
				} else {
					let _node = Node()
					node.children[c] = _node
					node = _node
				}
			}
			
			node.isWord = true
		}
		
		func getAppendableWords(for sequence: [Character]) -> [[Character]] {
			var p = root
			var currentSequence: [Character] = []
			var words: [[Character]] = []
			
			for c in sequence {
				currentSequence.append(c)
				guard let _node = p.children[c] else {
					break
				}
				
				if _node.isWord {
					words.append(currentSequence)
				}
				p = _node
			}
			
			return words
		}
	}
	
	
	func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
		let tree = TrieTree()
		tree.add(wordDict)
		var ans: [String] = []
		backtrack([], Array(s), tree, &ans)
		return ans
	}
	
	func backtrack(_ curr: [[Character]], _ s: [Character], _ tree: TrieTree, _ ans: inout [String]) {
		let currLength = curr.reduce(into: 0, { $0 = $0 + $1.count })
		
		if currLength == s.count {
			ans.append(curr.map({ String($0) }).joined(separator: " "))
			return
		}
		
		let remaining = Array(s[currLength...])
		let possibleWords = tree.getAppendableWords(for: remaining)
		
		for word in possibleWords {
			backtrack(curr + [word], s, tree, &ans)
		}
		
		return
	}
}