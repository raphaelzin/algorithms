//
// 1344. Angle Between Hands of a Clock.swift
// Created by Raphael Souza on 2021-05-06.

class Solution {
	func angleClock(_ hour: Int, _ minutes: Int) -> Double {
		let hours: Double = hour == 12 ? 0 : Double(hour)
		
		let hoursHandDegrees = hours*30 + Double(minutes)*0.5
		let minutesHandDegrees = Double(minutes) * 6
		
		let absDiff = abs(hoursHandDegrees - minutesHandDegrees)
		return absDiff > 180 ? 360-absDiff : absDiff
	}
}

let solution = Solution()

print(solution.angleClock(12, 30))
print(solution.angleClock(3, 30))
print(solution.angleClock(3, 15))
print(solution.angleClock(4, 50))
print(solution.angleClock(12, 0))