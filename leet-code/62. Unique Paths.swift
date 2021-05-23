//
// 62. Unique Paths
// Created by Raphael Souza on 2021-05-22.

class Solution {
	func uniquePaths(_ m: Int, _ n: Int) -> Int {
		if m == 1 || n == 1 { return 1 }
		
		var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
		for i in 1..<m { matrix[i][0] = 1 }
		for i in 1..<n { matrix[0][i] = 1 }
		
		for row in 1..<m {
			for col in 1..<n {
				matrix[row][col] = matrix[row][col-1] + matrix[row-1][col]
			}
		}
		return matrix[m-1][n-1]
	}
}

let solution = Solution()
print(solution.uniquePaths(3, 7))