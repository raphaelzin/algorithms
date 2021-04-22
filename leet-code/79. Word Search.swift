class Solution {
	
	func exist(_ board: [[Character]], _ word: String) -> Bool {
		let chars = Array(word)
		var vBoard = board
		
		for row in 0..<board.count {
			for col in 0..<board[row].count {
				if backtrack(&vBoard, row, col, chars, 0) {
					return true
				}
			}
		}
		return false
	}

	func backtrack(_ board: inout [[Character]], _ x: Int, _ y: Int, _ word: [Character], _ index: Int) -> Bool {
		if index == word.count {
			return true
		}
		
		if x < 0 || y < 0 || y >= board[0].count || x >= board.count || word[index] != board[x][y] {
			return false
		}
		
		board[x][y] = "."
		if backtrack(&board, x+1, y, word, index+1) {
			return true
		}
		if backtrack(&board, x-1, y, word, index+1) {
			return true
		}
		if backtrack(&board, x, y+1, word, index+1) {
			return true
		}
		if backtrack(&board, x, y-1, word, index+1) {
			return true
		}
		board[x][y] = word[index]
		
		return false
	}

}

print(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))