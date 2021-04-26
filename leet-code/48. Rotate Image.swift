//
// Rotate Image.txt
// Created by Raphael Souza on 2021-04-25.

class Solution {
	func rotate(_ matrix: inout [[Int]]) {
		let squares = matrix.count/2
		let side = matrix.count
		
		var temp = matrix[0][0]
		var temp2 = 0

		for square in 0..<squares {
			for i in 0..<side-(square*2)-1 {
				
				// Top
//				matrix[square][square+i]
				
				// Right
//				matrix[square+i][side-square-1]
				
				// Left
//				matrix[side-square-1-i][square]
				
				// bottom
//				matrix[side-square-1][side-square-1-i]
				
				temp = matrix[square+i][side-square-1]
				matrix[square+i][side-square-1] = matrix[square][square+i]
				
				temp2 = matrix[side-square-1][side-square-1-i]
				matrix[side-square-1][side-square-1-i] = temp
				
				temp = matrix[side-square-1-i][square]
				matrix[side-square-1-i][square] = temp2
				
				matrix[square][square+i] = temp
			}
		}
	}
}

let solution = Solution()
var matrix = [[1,2,3], [4,5,6], [7,8,9]]
solution.rotate(&matrix)
print(matrix)