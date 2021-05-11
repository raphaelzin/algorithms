//
// Untitled 15.txt
// Created by Raphael Souza on 2021-04-30.

//973. K Closest Points to Origin

import Foundation

class Solution {
	func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
		var arr: [(point: [Int], distance: Double)] = []
		
		for point in points {
			let distance = sqrt(Double(point[0]*point[0] + point[1]*point[1]))
			if arr.isEmpty {
				arr.append((point, distance))
				continue
			}
			
			var low: Int = 0
			var high: Int = arr.count-1
			var mid: Int
			
			while low <= high {
				mid = (low + high)/2
				if arr[mid].distance > distance {
					high = mid-1
				} else {
					low = mid+1
				}
			}
			
			arr.insert((point, distance), at: low)
		}
		
		return arr[0..<k].map { $0.point }
	}
}

let sol = Solution()
print(sol.kClosest([[1,3],[-2,2]], 1))
print(sol.kClosest([[3,3],[5,-1],[-2,4]], 2))
