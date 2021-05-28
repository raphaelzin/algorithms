//
// 88. Merge Sorted Array.swift
// Created by Raphael Souza on 2021-05-27.

class Solution {
	func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
		var p1 = 0
		var p2 = 0
		nums1.removeLast(n)
		
		while p1 < nums1.count && p2 < nums2.count {
			if nums1[p1] >= nums2[p2] {
				nums1.insert(nums2[p2], at: p1)
				p2 += 1
			}
			p1 += 1
		}
		
		if p2 < nums2.count {
			for i in p2..<nums2.count {
				nums1.append(nums2[i])
			}
		}
	}
}

let sol = Solution()
var arr = [0]
sol.merge(&arr, 0, [6], 1)
print(arr)
