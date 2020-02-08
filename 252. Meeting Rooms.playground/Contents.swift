import UIKit

var str = "Hello, playground"


/*
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

 Example 1:

 Input: [[0,30],[5,10],[15,20]]
 Output: false
 Example 2:

 Input: [[7,10],[2,4]]
 Output: true
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 
 */


class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        
        guard intervals.count > 0 else {
            return true
        }
        
        let sortedArray = intervals.sorted(by: { $0[0] < $1[0] })
                
        for i in 0..<intervals.count-1{
            if sortedArray[i+1][0] < sortedArray[i][1] {
                return false
            }
        }
        
        return true
    }
}


var sol = Solution()
sol.canAttendMeetings([[0,30],[5,10],[15,20]])
sol.canAttendMeetings([[7,10],[2,4]])
