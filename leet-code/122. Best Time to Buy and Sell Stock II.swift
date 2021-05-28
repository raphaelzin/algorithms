//
// 122. Best Time to Buy and Sell Stock II.swift
// Created by Raphael Souza on 2021-05-26.

class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		var i = 0
		var profit = 0
		
		while i < prices.count-1 {
			profit += max(0, prices[i+1]-prices[i])
			i += 1
		}
		return profit
	}
}