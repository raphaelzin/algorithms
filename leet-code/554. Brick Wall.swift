//
// 554. Brick Wall.swift
// Created by Raphael Souza on 2021-04-22.

class Solution {
	func leastBricks(_ wall: [[Int]]) -> Int {
		var gaps: [Int: Int] = [:]
		
		for row in wall {
			if row.count < 2 { continue }
			var gap = row[0]
			gaps[gap] = (gaps[gap] ?? 0) + 1
			
			for i in 1..<row.count-1 {
				gap += row[i]
				gaps[gap] = (gaps[gap] ?? 0) + 1
			}
		}
		
		return wall.count - (gaps.values.max() ?? 0)
	}
}


var input = [[1,2,2,1],
	[3,1,2],
	[1,3,2],
	[2,4],
	[3,1,2],
	[1,3,1,1]]

input = [[1], [1], [1]]

let solution = Solution()
let ans = solution.leastBricks(input)
							
print(ans)