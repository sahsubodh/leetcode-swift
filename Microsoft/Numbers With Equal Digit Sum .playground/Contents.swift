import UIKit

var str = "Hello, playground"


//https://leetcode.com/discuss/interview-question/365872/


func solution(_ a:[Int])  -> Int {
    
    var dict:[Int:Int] = [:]
    
    var maxsum = -1
    
    for i in 0..<a.count{
        
        let sum = digitSum(a[i])
        
        if dict[sum] == nil {
            dict[sum] = a[i]
        } else {
            maxsum = max(maxsum, dict[sum]! + a[i])
            dict[sum] = max(a[i], dict[sum]!)
        }
    }
    
    return maxsum
    
}

private func digitSum(_ num:Int) -> Int {
    
    var sum = 0
    var num = num
    while num != 0 {
        sum += num % 10
        num = num / 10
    }
    return sum
}


var A = [51,71,17,42]
var B = [42,33,60]
var C = [51,32,43]

print(solution(A))
print(solution(B))
print(solution(C))
