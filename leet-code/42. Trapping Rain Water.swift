class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var left = 0
        var right = height.count - 1
        
        var max_left = 0
        var max_right = 0
        
        var ans = 0
        
        while left < right {
            if height[left] < height[right] {
                if height[left] > max_left {
                    max_left = height[left]
                } else {
                    ans += max_left - height[left]
                }
                left += 1
            } else {
                if height[right] > max_right {
                    max_right = height[right]
                } else {
                    ans += max_right - height[right]
                }
                right -= 1
            }
        }
        
        return ans
    }
}

let sol = Solution()
print(sol.trap([0,1,0,2,1,0,1,3,2,1,2,1]))