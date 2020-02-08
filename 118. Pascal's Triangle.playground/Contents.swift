import UIKit

var str = "Hello, playground"
/*
Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.


In Pascal's triangle, each number is the sum of the two numbers directly above it.

Example:

Input: 5
Output:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
] */
 


class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result:[[Int]] = []
        
        for i in 0..<numRows{
            var currentrow:[Int] = []
            
            for j in 0..<i+1{
                if j == 0 || i == j {
                    currentrow.append(1)
                } else {
                    let first = result[i-1][j];
                    let second = result[i-1][j-1];
                    currentrow.append(first+second)
                }
            }
            result.append(currentrow)

        }
        
        return result
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
         var result:[[Int]] = []
         
         for i in 0..<rowIndex{
             var currentrow:[Int] = []
             
             for j in 0..<i+1{
                 if j == 0 || i == j {
                     currentrow.append(1)
                 } else {
                     let first = result[i-1][j];
                     let second = result[i-1][j-1];
                     currentrow.append(first+second)
                 }
             }
             result.append(currentrow)

         }
         
         return result[rowIndex]
     }
    
    func getRow1(_ rowIndex: Int) -> [Int] {
        
        var currentrow:[Int] = Array.init(repeating: 0, count: rowIndex+1)
        
        guard rowIndex > 0 else {
            return [1]
        }

        if rowIndex == 1 {
            return [1]
        }
        
        
        if rowIndex == 2 {
            return [1,1]
        }
        
        currentrow[0] = 1
        
        for i in 1...rowIndex{
            for j in stride(from: i, to: 0, by: -1){
                currentrow[j] += currentrow[j-1];
            }
        }
        currentrow[currentrow.count-1] = 1
        return currentrow
       }
}


var sol = Solution()
//sol.generate(5)

sol.getRow1(3)
