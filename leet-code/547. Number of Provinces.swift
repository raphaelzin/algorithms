//
// 547. Number of Provinces
// Created by Raphael Souza on 2021-09-02.

class Solution {
	func findCircleNum(_ isConnected: [[Int]]) -> Int {
		guard !isConnected.isEmpty else {
			return 0
		}
		
		var visited = Array(repeating: false, count: isConnected.count)
		let graph = isConnected.enumerated().map({ parse($0, $1) })
		var stack: [Int] = []
		var provinceCount = 0
		
		for i in 0..<graph.count {
			if visited[i] { continue }
			stack = graph[i]
			while !stack.isEmpty {
				let adj = stack.removeLast()
				if visited[adj] { continue }
				
				visited[adj] = true
				let city = graph[adj]
				stack.append(contentsOf: city)
			}
			
			provinceCount += 1
		}
		
		return provinceCount
	}
	
	private func parse(_ index: Int, _ graph: [Int]) -> [Int] {
		var g: [Int] = []
		for i in 0..<graph.count where index != i && graph[i] == 1 {
			g.append(i)
		}
		
		return g
	}
}
