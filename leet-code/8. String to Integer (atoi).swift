import Foundation

class Solution {
	func myAtoi(_ s: String) -> Int {
		let arr = Array(s)
		var i = 0
		var isParsingNumber = false
		var sign = 1
		var ans: Int = 0
		
		while i < arr.count {
			let c = arr[i]
			if isParsingNumber && !c.isNumber {
				break
			}
			
			if !c.isNumber {
				if c == " " {
					i += 1
					continue
				} else if (c == "+" || c == "-") && (i < arr.count-1 && arr[i+1].isNumber) {
					sign = c == "-" ? -1 : 1
					i += 1
					continue
				} else {
					return 0
				}
			}

			isParsingNumber = true
			let tup = ans.multipliedReportingOverflow(by: 10)
			if tup.overflow {
				return sign == -1 ? -2147483648 : 2147483647
			} else {
				ans = tup.partialValue
			}
			
			
			let tup2 = ans.addingReportingOverflow(Int(String(c))!)
			if tup2.overflow {
				return sign == -1 ? -2147483648 : 2147483647
			} else {
				ans = tup2.partialValue
			}
			i += 1
		}
		ans = ans*sign
		if ans > Int32.max { 
			return 2147483647
		} else if ans < Int32.min {
			return -2147483648
		}
		return ans
	}
}

let solution = Solution()
print(solution.myAtoi("4193 with words"))
print(solution.myAtoi("-21 with words"))
print(solution.myAtoi("with -21 words"))
print(solution.myAtoi("   -22 words"))
print(solution.myAtoi("-91283472332"))
print(solution.myAtoi("+1"))
print(solution.myAtoi("3.14159"))
print(solution.myAtoi("+-12"))
print(solution.myAtoi("+"))
print(solution.myAtoi("00000-42a1234"))
print(solution.myAtoi("-000000000000000000000000000000000000000000000000001"))
print(solution.myAtoi("20000000000000000000"))
