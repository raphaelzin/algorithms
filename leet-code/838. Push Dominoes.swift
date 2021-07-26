//
// 838. Push Dominoes.swift
// Created by Raphael Souza on 2021-07-26.

class Solution {
	func pushDominoes(_ dominoes: String) -> String {
		var buffer: [Character] = []
		var output: [Character] = []
		
		for c in dominoes {
			if c == "L" {
				if !buffer.isEmpty && buffer[0] == "R" {
					buffer.append("L")
					for i in 1..<(buffer.count)/2 {
						buffer[i] = "R"
						buffer[buffer.count-1-i] = "L"
					}
					output.append(contentsOf: buffer)
				} else {
					output.append(contentsOf: Array(repeating: "L", count: buffer.count+1))
				}
				buffer = []
			} else if c == "R" {
				if !buffer.isEmpty && buffer[0] == "R" {
					output.append(contentsOf: Array(repeating: "R", count: buffer.count))
				} else {
					output.append(contentsOf: buffer)
				}
				
				buffer = ["R"]
			} else if c == "." {
				buffer.append(c)
			}
		}
		
		if !buffer.isEmpty {
			if buffer[0] == "R" {
				output.append(contentsOf: Array(repeating: "R", count: buffer.count))
			} else {
				output.append(contentsOf: buffer)
			}
		}
		
		return String(output)
	}
}