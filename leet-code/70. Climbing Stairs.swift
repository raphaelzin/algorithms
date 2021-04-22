//
// 70. Climbing Stairs
// Created by Raphael Souza on 2021-04-21.

import Darwin

class Solution {
	func climbStairs(_ n: Int) -> Int {
		let sqrt5 = sqrt(5)
		let power = Double(n+1)
		
		let fn = pow(((1+sqrt5)/2), power) - pow(((1-sqrt5)/2), power)
		return Int(fn/sqrt5)
	}
}

print(Solution().climbStairs(3))