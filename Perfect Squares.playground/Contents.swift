import UIKit

var str = "Hello, playground"


//class Solution {
//
//  public int numSquares(int n) {
//    int dp[] = new int[n + 1];
//    Arrays.fill(dp, Integer.MAX_VALUE);
//    // bottom case
//    dp[0] = 0;
//
//    // pre-calculate the square numbers.
//    int max_square_index = (int) Math.sqrt(n) + 1;
//    int square_nums[] = new int[max_square_index];
//    for (int i = 1; i < max_square_index; ++i) {
//      square_nums[i] = i * i;
//    }
//
//    for (int i = 1; i <= n; ++i) {
//      for (int s = 1; s < max_square_index; ++s) {
//        if (i < square_nums[s])
//          break;
//        dp[i] = Math.min(dp[i], dp[i - square_nums[s]] + 1);
//      }
//    }
//    return dp[n];
//  }
//}

class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp:[Int] = Array.init(repeating: Int.max, count: n+1)
        
        dp[0] = 0
        let sqrt_val = Int(sqrt(Float(n))) + 1
        var square_nums:[Int] = Array.init(repeating: 0, count: sqrt_val)
        
        for i in 1..<sqrt_val{
            square_nums[i] = i * i;
        }
        
        for i in 1...n{
            for j in 1..<sqrt_val{
                if (i < square_nums[j]){
                    break;
                }
                
                dp [i] = min(dp[i], dp[i-square_nums[j]]+1)
            }
        }
        
        
        return dp[n]
    }
}

var sol = Solution()
sol.numSquares(12)
