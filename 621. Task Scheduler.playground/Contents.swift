import UIKit

var str = "Hello, playground"


/*Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks. Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.

However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.

You need to return the least number of intervals the CPU will take to finish all the given tasks.

 

Example:

Input: tasks = ["A","A","A","B","B","B"], n = 2
Output: 8
Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
 

Note:

The number of tasks is in the range [1, 10000].
The integer n is in the range [0, 100].*/


//https://leetcode.com/problems/task-scheduler/discuss/114018/ac-solution-code

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        
        guard tasks.count > 0  else {
            return 0
        }

        var counter = Array.init(repeating: 0, count: 26)
        
        //arrange in order of max items in the end
        for task in tasks{
            let index = Int (task.unicodeScalars.first!.value - Unicode.Scalar("A").value)
            counter[index] += 1
        }
        
        counter.sort()
        
        var mostFrequentUniqueChars = 0
        let topFrequency = counter[25]
        
        
        for i in 0..<26 where counter[i] == topFrequency {
            mostFrequentUniqueChars += 1
        }
        
        return max(tasks.count, (topFrequency-1)*(n+1)+mostFrequentUniqueChars)
    }
}

//Binary operator '-' cannot be applied to operands of type 'UInt32' and 'Int'
