class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let dialTable: [Character: String] = ["2": "abc", "3": "def", "4":"ghi", "5":"jkl", "6":"mon", "7":"pqrs", "8":"tuv", "9":"wxyz"]
        let charDigits = Array(digits)
        
        return permute(0, charDigits, "", dialTable)
    }
    
    private func permute(_ index: Int, _ digits: [Character], _ prefix: String, _ dialTable: [Character: String]) -> [String] {
        if index == digits.count {
            return [prefix]
        }
        let chars = dialTable[digits[index]]!
        var ans: [String] = []
        for i in chars {
            ans.append(contentsOf: permute(index+1, digits, prefix + String(i), dialTable))
        }
        
        return ans
    }
}


//["2"]

let solution = Solution()
print(solution.letterCombinations("23"))