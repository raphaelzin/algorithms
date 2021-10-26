//
// 841. Keys and Rooms
// Created by Raphael Souza on 2021-09-01.

class Solution {
	func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
		var visited = Array(repeating: false, count: rooms.count)
		var toVisit = Set<Int>(rooms[0])
		visited[0] = true
		
		while !toVisit.isEmpty {
			let room = toVisit.removeFirst()
			if visited[room] {
				continue
			} else {
				visited[room] = true
			}
			
			toVisit.formUnion(rooms[room])
		}
		
		return visited.allSatisfy({ $0 })
	}
}

let sol = Solution()
print(sol.canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))