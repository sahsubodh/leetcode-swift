import UIKit

var str = "Hello, playground"


    var result = 0

    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
      if nums.count == 0 {
          return 0
      }
      
      var sum = 0
      for num in nums {
          sum += num
      }
      
      if (S < -sum || S > sum) {
          return 0
      }
      
       //dp[i] -> the number of ways to have sum = i - sum
     var dp = Array.init(repeating:0,count:sum*2+1)
      dp[sum] = 1
      

      for i in 0..<nums.count{
          var tempTarget = Array.init(repeating:0,count:sum*2+1)
          for j in 0..<sum*2+1 {
              if dp[j] != 0 {
                  tempTarget[j - nums[i]] += dp[j]
                  tempTarget[j + nums[i]] += dp[j]
              }
          }
          
          dp = tempTarget
      }
      
      print(dp)
        print(sum)
        print(sum+S)
      return dp[sum+S]
      
  }

    func findTargetSumWays1(_ nums: [Int], _ S: Int) -> Int {
        
        var memo:[[Int]] = Array.init(repeating: Array.init(repeating: Int.min, count: 2001), count: nums.count)
        
        result = calculateSum(nums, index: 0, sum: 0, S, memo: &memo)
        
        return result
    }
    
    private func calculateSum(_ nums:[Int], index i:Int, sum:Int,_ S:Int,memo: inout [[Int]]) -> Int {
        if (nums.count == i){
            if sum == S{
                return 1
            } else {
                return 0
            }
        } else {
            print("0")

            if (memo[i][sum+1000] != Int.min) {
                return memo[i][sum+1000]
            }

            let add = calculateSum(nums, index: i+1, sum: sum + nums[i], S,memo: &memo)
            let subtract = calculateSum(nums, index: i+1, sum: sum - nums[i], S,memo: &memo)
            memo[i][sum+1000] = add + subtract
            return memo[i][sum+1000]
        }
    }
    

var input = [1,1,1,1,1]
var target = 3

var sol = findTargetSumWays(input,target)
