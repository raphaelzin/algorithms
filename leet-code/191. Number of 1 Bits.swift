//
// 191. Number of 1 Bits
// Created by Raphael Souza on 2021-05-11.

class Solution {
	func hammingWeight(_ n: Int) -> Int {
		var num = n
		var ans = 0
		while num != 0 {
			ans += num&1
			num = num>>1
		}
		return ans
	}
}

let solution = Solution()
print(solution.hammingWeight(13))