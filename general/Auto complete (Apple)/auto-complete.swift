//
// auto-complete.swift
// Created by Raphael Souza on 2021-06-17.

class TrieTree {
	private let root = TrieNode()
	
	func search(for term: String) -> [String] {
		var node: TrieNode? = root
		for char in term {
			if node == nil { break }
			node = node?.children[char]
		}
		
		return node?.candidates ?? []
	}
	
	func add(words: [String]) {
		words.forEach {
			add(word: $0)
		}
	}
	
	func add(word: String) {
		var p: TrieNode = root
		for char in word {
			if let node = p.children[char] {
				node.candidates.append(word)
				p = node
			} else {
				let node = TrieNode()
				node.candidates = [word]
				p.children[char] = node
				p = node
			}
		}
	}
}

extension TrieTree {
	class TrieNode {
		var candidates: [String] = []
		var children: [Character: TrieNode] = [:]
	}
}

class AutoComplete {
	private var tree = TrieTree()
	
	init(history: [String]) {
		tree.add(words: history)
	}
	
	func input(_ term: String) -> [String] {
		/// To limit results when there's only one match:
		///
		/// let results = tree.search(for: term)
		/// return results.count == 1 ? results : []
		
		tree.search(for: term)
	}
	
	func addToHistory(word: String) {
		tree.add(word: word)
	}
}

let history = ["Apple", "Application", "Letter", "Llama", "Ledger"]
let auto = AutoComplete(history: history)
print(auto.input("Letter"))
print(auto.input("R"))

auto.addToHistory(word: "Raphael")
auto.addToHistory(word: "Runaway")
print(auto.input("R"))