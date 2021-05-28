//
// 91. Decode Ways.swift
// Created by Raphael Souza on 2021-05-27.

class Solution {
	func numDecodings(_ s: String) -> Int {
		guard !s.isEmpty && s.first! != "0" else { return 0 }
		if s.count == 1 { return 1 }
		
		var dp = Array(repeating: 0, count: s.count+1)
		let arr = s.map { $0.wholeNumberValue! }
		
		dp[0] = 1
		dp[1] = 1
		
		for i in 2...arr.count {
			print(dp)
			let dg = (arr[i-2]*10)+arr[i-1]
			let d = arr[i-1]
			
			if d > 0 && d < 10 {
				dp[i] += dp[i-1]
			}
			if dg > 9 && dg < 27 {
				dp[i] += dp[i-2]
			}
		}
		return dp.last!
	}
}

let solution = Solution()
print(solution.numDecodings("2201"))
print(solution.numDecodings("0"))
print(solution.numDecodings("1"))