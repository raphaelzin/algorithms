//
// 322. Coin Change.swift
// Created by Raphael Souza on 2021-05-13.

class Solution {
	func coinChange(_ coins: [Int], _ amount: Int) -> Int {
		guard amount > 0 else { return 0 }
		var dp: [Int] = Array(repeating: amount+1, count: amount+1)
		dp[0] = 0
		
		for coin in coins {
			for singleAmount in coin...amount {
				dp[singleAmount] = min(dp[singleAmount], dp[singleAmount-coin] + 1)
			}
		}

		return dp[amount] > amount ? -1 : dp[amount]
	}
}

let solution = Solution()
//print(solution.coinChange([186,419,83,408], 6249))
print(solution.coinChange([1,2,5], 11))
//print(solution.coinChange([1], 0))