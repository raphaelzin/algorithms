//
// 3. Longest Substring Without Repeating Characters.swift
// Created by Raphael Souza on 2020-12-08.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var max = 0
        
        var left = 0
        var right = 0
        
        var nums: Set<Character> = .init()
        
        while right < (chars.count) {
            if nums.contains(chars[right])  {
                while chars[left] != chars[right] {
                    nums.remove(chars[left])
                    left += 1
                }
                left += 1
                
            } else {
                nums.insert(chars[right])
            }
            
            if nums.count > max {
                max = nums.count
            }
            
            right += 1
        }
        
        return max
    }
}

let solution = Solution()
while let line = readLine() {
    let size = solution.lengthOfLongestSubstring(line)
    
    print("\(size) - \(line)")
}