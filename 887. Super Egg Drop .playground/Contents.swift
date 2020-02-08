import UIKit

var str = "Hello, playground"


/*You are given K eggs, and you have access to a building with N floors from 1 to N.

Each egg is identical in function, and if an egg breaks, you cannot drop it again.

You know that there exists a floor F with 0 <= F <= N such that any egg dropped at a floor higher than F will break, and any egg dropped at or below floor F will not break.

Each move, you may take an egg (if you have an unbroken one) and drop it from any floor X (with 1 <= X <= N).

Your goal is to know with certainty what the value of F is.

What is the minimum number of moves that you need to know with certainty what F is, regardless of the initial value of F?

 

Example 1:

Input: K = 1, N = 2
Output: 2
Explanation:
Drop the egg from floor 1.  If it breaks, we know with certainty that F = 0.
Otherwise, drop the egg from floor 2.  If it breaks, we know with certainty that F = 1.
If it didn't break, then we know with certainty F = 2.
Hence, we needed 2 moves in the worst case to know what F is with certainty.
Example 2:

Input: K = 2, N = 6
Output: 3
Example 3:

Input: K = 3, N = 14
Output: 4
 

Note:

1 <= K <= 100
1 <= N <= 10000
 
 */


/*Drop eggs is a very classical problem.
Some people may come up with idea O(KN^2)
where dp[K][N] = 1 + max(dp[K - 1][i - 1],dp[K][N - i]) for i in 1...N.
However this idea is very brute force, for the reason that you check all possiblity.

So I consider this problem in a different way:
dp[M][K]means that, given K eggs and M moves,
what is the maximum number of floor that we can check.

The dp equation is:
dp[m][k] = dp[m - 1][k - 1] + dp[m - 1][k] + 1,
which means we take 1 move to a floor,
if egg breaks, then we can check dp[m - 1][k - 1] floors.
if egg doesn't breaks, then we can check dp[m - 1][k] floors.

dp[m][k] is similar to the number of combinations and it increase exponentially to N

Time Complexity:
For time, O(NK) decalre the space, O(KlogN) running,
For space, O(NK).
 */


/// the + 1 simply means the current floor. while dp[m - 1][k - 1] means floors below current floor and dp[m-1][k] means those above
//This one move will separate the floors into two non-overlapping groups, below or above (the current level we choose to drop the egg); so no matter what happened to the egg, we only need to check one of those two group. If we need to check the level below the current level, then it means the egg is break, so the maximum level we are able to check is dp[m - 1][k - 1]. Otherwise if we need to check the level above or equal o the current level, it means the egg is not break, so the maximum level we can check is dp[m - 1][k], we should only return dp[m - 1][k - 1] + dp[m - 1][k]; however, we count the level from 0, instead of 1, so we need to add the extra one level (i.e; if dp[m - 1][k - 1] = 1 and dp[m - 1][k] = 2, means we can check (2 + 3 == 5) levels, so we need to return 4; which is dp[m - 1][k - 1] + dp[m - 1][k] + 1)

class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        
       var dp = Array.init(repeating: Array.init(repeating: 0, count: K+1), count: N+1)
             
        var m = 0
        while (dp[m][K]<N){
            m += 1
            for k in 1..<K+1{
                dp[m][k] = dp[m-1][k-1] + dp[m-1][k] + 1
            }
        }
             
        return m
    }
}

var sol = Solution()
sol.superEggDrop(1, 2)
