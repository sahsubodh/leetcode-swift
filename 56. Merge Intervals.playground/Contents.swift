import UIKit

var str = "Hello, playground"


/*Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */



class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result:[[Int]] = []
        
        if intervals.count < 1 {
            return result
        }
        
        //sort by start interval for all
        let sortedArray = intervals.sorted{ $0[0] < $1[0]}
        result.append(sortedArray.first!)
                
        //start comparison from index 1
        for i in 1..<sortedArray.count{
                 let prevStart = result.last![0]
                 let prevEnd = result.last![1]
                 let currStart = sortedArray[i][0]
                 let currEnd = sortedArray[i][1]
                 if prevEnd >= currStart && prevEnd <= currEnd {
                     let newEntry = [prevStart, currEnd]
                     result.removeLast()
                     result.append(newEntry)
                 } else if prevEnd < currEnd {
                     let newEntry = [currStart, currEnd]
                     result.append(newEntry)
                 }
                 
        }
        
        return result
    }
}

var sol = Solution()
sol.merge([[1,3],[2,6],[8,10],[15,18]])
