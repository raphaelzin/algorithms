//
// 6. ZigZag Conversion.swift
// Created by Raphael Souza on 2020-12-15.

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var goingUp = false
        var ans = Array(repeating: "", count: numRows)
        var currentLine = 0
        
        for c in s {
            ans[currentLine].append(c)
            if goingUp {
                currentLine -= 1
            } else {
                currentLine += 1
            }
            
            if currentLine == 0 {
                goingUp = false
            } 
            
            if currentLine == (numRows-1) {
                goingUp = true
            }
        }
        var result = ""
        for line in ans {
            result.append(contentsOf: line)
        }
        return result
    }
}

let sol = Solution()
let input = "PAYPALISHIRING"
print(sol.convert(input, 4) == "PINALSIGYAHRPI")
print(sol.convert(input, 3) == "PAHNAPLSIIGYIR")
print(sol.convert(input, 1) == "PAYPALISHIRING")

//print(sol.convert("A", 1))


//print(sol.convert("wlrbbmqbhcdarzowkkyhiddqscdxrjmowfrxsjybldbefsarcbynecdyggxxpklorellnmpapqfwkhopkmco", 61))