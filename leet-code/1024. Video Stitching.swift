//
// 1024. Video Stitching.swift
// Created by Raphael Souza on 2021-05-16.
//

class Solution {
	func videoStitching(_ clips: [[Int]], _ T: Int) -> Int {
		guard T > 0 else { return 0 }
		var dp: [Int] = Array(repeating: T + 1, count: T + 1)
		dp[0] = 0
		
		for i in 1...T {
			if dp[i-1] >= T {
				break
			}
			
			for clip in clips {
				if (clip[0]...clip[1]).contains(i) {
					dp[i] = min(dp[i], dp[clip[0]] + 1)
					print(dp)
				}
			}
		}
		
		return dp[T] > T ? -1 : dp[T]
	}
}

let solution = Solution()
//solution.videoStitching([[0,2],[4,6],[8,10],[1,9],[1,5],[5,9]], 10)
solution.videoStitching([[0,3],[4,8]], 7)
