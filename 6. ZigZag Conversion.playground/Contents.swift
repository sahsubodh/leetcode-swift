import UIKit

var str = "Hello, playground"

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:

 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 */


class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        
        guard s.count > 1, numRows > 1 else { return s }
        
        var rows = Array.init(repeating: "", count: numRows)
        let threshold = (numRows - 1) * 2
        
        for (index,char) in s.enumerated() {
            let location = index % threshold
            if location < numRows {
                rows[location].append(char)
            } else {
                let upLocation = location - numRows
                rows[numRows - 1 - upLocation - 1].append(char)
            }
            
            
        }
        
        print(rows)
        let answer = rows.flatMap { $0 }
        return String(answer)
    }
}


var s = "PAYPALISHIRING", numRows = 3

var sol = Solution()
sol.convert(s, numRows)
