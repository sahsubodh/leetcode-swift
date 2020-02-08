import UIKit

var str = "Hello, playground"


    var result = 0

    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        
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
