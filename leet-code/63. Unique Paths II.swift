//
// 63. Unique Paths II
// Created by Raphael Souza on 2021-05-22.

class Solution {
	func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
		guard obstacleGrid[0][0] != 1 else { return 0 }
		var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
		
		for i in 1..<obstacleGrid[0].count {
			if obstacleGrid[0][i] == 1 { break }
			matrix[0][i] = 1 
		}
		
		for i in 1..<obstacleGrid.count {
			if obstacleGrid[i][0] == 1 { break }
			matrix[i][0] = 1
		}
		
		for row in 1..<matrix.count {
			for col in 1..<matrix[row].count {
				if obstacleGrid[row][col] == 1 {
					matrix[row][col] = 0
				} else {
					matrix[row][col] = matrix[row-1][col] + matrix[row][col-1]
				}
			}
		}
		
		if matrix.count == 1 && matrix[0].count == 1 && matrix[0][0] != 1 {
			return 1
		}
		
		return matrix.last!.last!
	}
}

let solution = Solution()
print(solution.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
print(solution.uniquePathsWithObstacles([[0]]))