//
// 73. Set Matrix Zeroes.swift
// Created by Raphael Souza on 2021-05-11.

class Solution {
	func setZeroes(_ matrix: inout [[Int]]) {
		var cols = Set<Int>()
		var rows = Set<Int>()
		
		var col = 0
		var row = 0
		
		while row < matrix.count {
			while col < matrix[row].count {
				if matrix[row][col] == 0 {
					cols.insert(col)
					rows.insert(row)
					
					for i in 0..<col {
						matrix[row][i] = 0
					}
					for i in 0..<row {
						matrix[i][col] = 0
					}
					
				} else if cols.contains(col) || rows.contains(row) {
					matrix[row][col] = 0
				}
				col += 1
			}
			row += 1
			col = 0
		}
	}
}


var matrix = [[1,1,1],[1,0,1],[1,1,1]]
let solution = Solution()
solution.setZeroes(&matrix)
print(matrix)
matrix = [[0,1,2,0],
		  [3,4,5,2],
		  [1,3,1,5]]
//[[0,0,0,0],[0,4,5,0],[0,3,1,0]]
solution.setZeroes(&matrix)
print(matrix)