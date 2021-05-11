//
// 36. Valid Sudoku.swift
// Created by Raphael Souza on 2021-03-27.

import Foundation

class Solution {
	func isValidSudoku(_ board: [[Character]]) -> Bool {
		for i in 0..<9 {
			if !isValidRow(board, i) || !isValidColumn(board, i) || !isValidBlock(board, i) {
				return false
			}
			
		}
		
		return true
	}
	
	func isValidRow(_ board: [[Character]], _ index: Int) -> Bool {
		var row: [Character] = board[index]
		row.removeAll(where: { $0 == "." })
		return row.count == Set(row).count
	}
	
	func isValidColumn(_ board: [[Character]], _ index: Int) -> Bool {
		let row = board.map { $0[index] }.filter { $0 != "." }
		return row.count == Set(row).count
	}
	
	func isValidBlock(_ board: [[Character]], _ index: Int) -> Bool {
		let rowIndex = (index%3)*3
		let columnIndex = (index/3)*3
		
		let row1 = [board[rowIndex][columnIndex],
					board[rowIndex][columnIndex+1],
					board[rowIndex][columnIndex+2],
					board[rowIndex+1][columnIndex],
					board[rowIndex+1][columnIndex+1],
					board[rowIndex+1][columnIndex+2],
					board[rowIndex+2][columnIndex],
					board[rowIndex+2][columnIndex+1],
					board[rowIndex+2][columnIndex+2]].filter { $0 != "." }
		
		return row1.count == Set(row1).count
	}
}


let board: [[Character]] = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

let board3: [[Character]] = 
[["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
[".","9","8",".",".",".",".","6","."],
["8",".",".",".","6",".",".",".","3"],
["4",".",".","8",".","3",".",".","1"],
["7",".",".",".","2",".",".",".","6"],
[".","6",".",".",".",".","2","8","."],
[".",".",".","4","1","9",".",".","5"],
[".",".",".",".","8",".",".","7","9"]]


let board2: [[Character]] = 
[[".",".",".",".","5",".",".","1","."],
 [".","4",".","3",".",".",".",".","."],
 [".",".",".",".",".","3",".",".","1"],
 ["8",".",".",".",".",".",".","2","."],
 [".",".","2",".","7",".",".",".","."],
 [".","1","5",".",".",".",".",".","."],
 [".",".",".",".",".","2",".",".","."],
 [".","2",".","9",".",".",".",".","."],
 [".",".","4",".",".",".",".",".","."]]

let solution = Solution()
print(solution.isValidSudoku(board))
print(solution.isValidSudoku(board2))
print(solution.isValidSudoku(board3))