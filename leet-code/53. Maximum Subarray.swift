//
// 53. Maximum Subarray.swift
// Created by Raphael Souza on 2020-12-06.

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var bsf = nums[0]
        var current = 0
        
        for num in nums {
            if current < 0 {
                current = 0
            }
            current += num
            if current > bsf {
                bsf = current
            }
        }
        
        return bsf
    }
}

let sol = Solution()
print(sol.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))