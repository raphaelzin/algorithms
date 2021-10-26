//
// 417. Pacific Atlantic Water Flow
// Created by Raphael Souza on 2021-09-01.

class Solution {
	private let directions = [[0,1], [1,0], [0,-1], [-1,0]]
	
	func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
		var pacific = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
		var atlantic = Array(repeating: Array(repeating: false, count: heights[0].count), count: heights.count)
		
		for i in 0..<heights.count {
			dfs(heights, heights[i][0], &pacific, i, 0)
			dfs(heights, heights[i][heights[i].count-1], &atlantic, i, heights[i].count-1)
		}
		
		
		for i in 0..<heights[0].count {
			dfs(heights, heights[0][i], &pacific, 0, i)
			dfs(heights, heights[heights.count-1][i], &atlantic, heights.count-1, i)
		}
		
		var solutions: [[Int]] = []
		
		for row in 0..<heights.count {
			for col in 0..<heights[row].count {
				if pacific[row][col] && atlantic[row][col] {
					solutions.append([row, col])
				}
			}
		}
		
		return solutions
	}
	
	private func dfs(_ heights: [[Int]], _ previousHeight: Int, _ ocean: inout [[Bool]], _ row: Int, _ col: Int) {
		if isOutOfBounds(heights, row, col) || ocean[row][col] || previousHeight > heights[row][col] {
			return
		}
		
		ocean[row][col] = true
		
		for direction in directions {
			dfs(heights, heights[row][col], &ocean, row + direction[1], col + direction[0])
		}
	}
	
	private func isOutOfBounds(_ heights: [[Int]], _ row: Int, _ col: Int) -> Bool {
		col < 0 || row < 0 || col >= heights[0].count || row >= heights.count
	}
}


let sol = Solution()
let ans = sol.pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])

print(ans)