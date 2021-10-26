//
// 1191. K-Concatenation Maximum Sum
// Created by Raphael Souza on 2021-08-29.

class Solution {
	func kConcatenationMaxSum(_ arr: [Int], _ k: Int) -> Int {
		let groupSum = arr.reduce(0,+)
		let mod = (1000000000+7)
		
		if k == 1 {
			return maxSum(arr, k: 1)%mod
		} else if groupSum < 0 {
			return maxSum(arr, k: 2)%mod
		}
		
		
		return (maxSum(arr, k: 2) + (k-2)*groupSum)%mod
	}
	
	func maxSum(_ arr: [Int], k: Int) -> Int {
		var curr = 0
		var bsf = 0
		var i = 0
		
		while i < (arr.count*k) {
			curr += arr[i%arr.count]
			curr = max(0, curr)
			bsf = max(bsf, curr)
			i += 1
		}
		
		return bsf
	}
}