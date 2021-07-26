//
// 1381. Design a Stack With Increment Operation.swift
// Created by Raphael Souza on 2021-07-26.

class CustomStack {
	
	var stack: [Int]
	var maxSize = 0
	
	init(_ maxSize: Int) {
		stack = Array()
		self.maxSize = maxSize
	}
	
	func push(_ x: Int) {
		guard stack.count < maxSize else { return }
		stack.append(x)
	}
	
	func pop() -> Int {
		stack.popLast() ?? -1
	}
	
	func increment(_ k: Int, _ val: Int) {
		for i in 0..<min(stack.count, k+1) {
			stack[i] += val
		}
	}
}