import UIKit

var str = "Hello, playground"

/*
 You have an array of logs.  Each log is a space delimited string of words.

 For each log, the first word in each log is an alphanumeric identifier.  Then, either:

 Each word after the identifier will consist only of lowercase letters, or;
 Each word after the identifier will consist only of digits.
 We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

 Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.

 Return the final order of the logs.

 Example 1:

 Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
 Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
  

 Constraints:

 0 <= logs.length <= 100
 3 <= logs[i].length <= 100
 logs[i] is guaranteed to have an identifier, and a word after the identifier.
 */


class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var letterLogs:[String] = []
        var numberLogs:[String] = []
        
        for log in logs{
            if isNumberLog(s: log) {
                numberLogs.append(log)
            } else {
                letterLogs.append(log)
            }
        }
        
        letterLogs.sort{ (a,b) -> Bool in
            let aLog = a[a.firstIndex(of: " ")!..<a.endIndex] + a[...a.firstIndex(of: " ")!]
            let bLog = b[b.firstIndex(of: " ")!..<b.endIndex] + b[...b.firstIndex(of: " ")!]
            print(aLog)
            return aLog.lexicographicallyPrecedes(bLog)
        }
        
        letterLogs.append(contentsOf: numberLogs)
        
        return letterLogs
    }
    
    func isNumberLog(s:String) -> Bool {
        let logArray = s.components(separatedBy: " ")
        if logArray[1] == logArray[1].uppercased() {
            return true
        } else
        {
            return false
        }
    }
}

var logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]

var sol = Solution()
print(sol.reorderLogFiles(logs))
