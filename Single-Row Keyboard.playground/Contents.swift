import UIKit

class Solution {
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        var dict:[Character: Int] = [:];
        var index = 0;
        for s in keyboard
        {
            dict[s] = index;
            index += 1;
//            print("dict key \(s) and value \(String(describing: dict[s]))")
        }
        
        
        let wordArray = Array(word);
        
        var result = dict[wordArray[0]];
        for i in 0..<wordArray.count-1
        {
            result! += abs(dict[wordArray[i]]! - dict[wordArray[i+1]]!)
        }
        
        return result!;
    }
    
    func defangIPaddr(_ address: String) -> String {
        
        let newAddr = address.replacingOccurrences(of: ".", with: "[.]")
        
        return newAddr;
    }
    
    func balancedStringSplit(_ s: String) -> Int {
        
        var balanceCount = 0;
        var count = 0;

        for char in s{
             count += (char == "L") ? 1 : -1
            if count == 0 {
                balanceCount += 1
            }
        }
      
        return balanceCount;
     }
    
    func isArmstrong(_ N: Int) -> Bool {
        
        var stringNum = String(N)
        let intArray = stringNum.compactMap{ $0.wholeNumberValue }
        
        let length = intArray.count
        
        var sum = 0;
        
        for i in intArray{
            sum += Int(pow(Double(i),Double(length)))
        }
        
        
        return (N == sum);
        
//        var sum: Double = 0
//               var s = "\(N)"
//               s.forEach({sum += pow(Double(String($0))!, Double(s.count))})
//               return Int(sum) == N
    }
    
        func peakIndexInMountainArray(_ A: [Int]) -> Int {
            
            var max = -1
            var index = 0
            
            
            while A[index] > max {
                    max = A[index]
                    index += 1
            }
     
            return index-1;
        }
    
}

var sol = Solution()

var ans4 = sol.peakIndexInMountainArray([0,2,1,0]) // 0,2,1,0 0,1,0
print(ans4)


//var ans = sol.calculateTime("abcdefghijklmnopqrstuvwxyz", "cba")
//print(ans)
//
//var ans1 = sol.defangIPaddr("1.1.1.1")
//print(ans1)

//var ans2 = sol.balancedStringSplit("LLLLRRRR")  //RLRRLLRLRL LLLLRRRR RLLLLRRRLR
//print(ans2)


//var ans3 = sol.isArmstrong(153)

