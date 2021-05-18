//
// 1326. Minimum Number of Taps to Open to Water a Garden.swift
// Created by Raphael Souza on 2021-05-17.

class Solution {
	func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
		guard !ranges.isEmpty else {
			return -1
		}
		
		let intervals = ranges.enumerated().map { i, e in
			[max(0, i-e), min(i+e, n)]
		}
		
		var dp = Array(repeating: n+1, count: n+1)
		dp[0] = 0
		
		for interval in intervals {
			for i in interval[0]...interval[1] {
				dp[i] = min(dp[i], dp[interval[0]] + 1)
			}
		}
		return dp[n] > n ? -1 : dp[n]
	}
}