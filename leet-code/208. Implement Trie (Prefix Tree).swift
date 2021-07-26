//
// 208. Implement Trie (Prefix Tree).swift
// Created by Raphael Souza on 2021-07-26.

class Trie {
	class Node {
		var children: [Character: Node] = [:]
		var isWord: Bool = false
	}
	
	var root: Node = Node()
	
	/** Initialize your data structure here. */
	init() {}
	
	/** Inserts a word into the trie. */
	func insert(_ word: String) {
		var node = root
		for c in word {
			if let child = node.children[c] {
				node = child
			} else {
				let newNode = Node()
				node.children[c] = newNode
				node = newNode
			}
		}
		
		node.isWord = true
	}
	
	/** Returns if the word is in the trie. */
	func search(_ word: String) -> Bool {
		var node = root
		for c in word {
			if let child = node.children[c] {
				node = child
			} else {
				return false
			}
		}
		
		return node.isWord
	}
	
	/** Returns if there is any word in the trie that starts with the given prefix. */
	func startsWith(_ prefix: String) -> Bool {
		var node = root
		
		for c in prefix {
			if let child = node.children[c] {
				node = child
			} else {
				return false
			}
		}
		
		return true
	}
}