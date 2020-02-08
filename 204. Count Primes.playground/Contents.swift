import UIKit

var str = "Hello, playground"


/*

 Count the number of prime numbers less than a non-negative number, n.

 Example:

 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 
 */


class Solution {
    
    func countPrimes(_ n: Int) -> Int {
        
        if n <= 1 {
            return 0
        }
        
        var arr = Array(repeating: true, count: n)
        arr[0] = false
        arr[1] = false
        var counter = 0
        
        for i in (2..<n) {
            if arr[i] {
                counter += 1
                
                var j = i
                
                while ( (j * i) < n) {
                    arr[i*j] = false
                    j += 1
                }
            }
        }
        
        return counter
    }
    
    
    func countPrimes1(_ n: Int) -> Int {
        
        var count = 0
        
        guard n > 2 else {
            return 0
        }
        
        for i in 1..<n{
            if (isPrime(i)) {
                count += 1
            }
        }
        return count
    }
    
    func isPrime(_ num:Int) -> Bool {
        if num <= 1 { return false; }
       
        var index = 2
        while (index*index<=num) {
            
            if num%index == 0 { return false}
            index += 1
        }
        
        return true
    }

}


var sol = Solution()
sol.countPrimes(12)
