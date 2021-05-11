//
// 200. Number of Islands.swift
// Created by Raphael Souza on 2021-04-14.

import Foundation

func expandAround(_ board: inout [[Character]], _ x: Int, _ y: Int) {
	if x < 0 || y < 0 || x >= board.count || y >= board[x].count {
		return
	}
	
	if board[x][y] == "0" {
		return
	}
	
	board[x][y] = "0"
	
	expandAround(&board, x+1, y) // right
	expandAround(&board, x-1, y) // left
	expandAround(&board, x, y+1) // top
	expandAround(&board, x, y-1) // bottom
}

func numIslands(_ grid: [[Character]]) -> Int {
	var inoutBoard = grid
	var islandCount = 0
	
	for row in 0..<inoutBoard.count {
		for col in 0..<inoutBoard[row].count {
			if inoutBoard[row][col] == "1" {
				expandAround(&inoutBoard, row, col)
				islandCount += 1
			}
		}
	}
	return islandCount
}
	