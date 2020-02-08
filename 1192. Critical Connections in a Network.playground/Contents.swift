import UIKit

var str = "Hello, playground"


/*There are n servers numbered from 0 to n-1 connected by undirected server-to-server connections forming a network where connections[i] = [a, b] represents a connection between servers a and b. Any server can reach any other server directly or indirectly through the network.

A critical connection is a connection that, if removed, will make some server unable to reach some other server.

Return all critical connections in the network in any order.

 

Example 1:



Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
Output: [[1,3]]
Explanation: [[3,1]] is also accepted.
 
 https://leetcode.com/problems/critical-connections-in-a-network/discuss/382632/Java-implementation-of-Tarjan-Algorithm-with-explanation
 
 */


class Solution {
  func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [[Int]](repeating: [Int](), count: n)
        for conn in connections {
            graph[conn[0]].append(conn[1])
            graph[conn[1]].append(conn[0])
        }
        
        var dists = [Int](repeating: -1, count: n)
        var res = [[Int]]()
        dfs(&graph, &dists, &res, -1, 0, 0)
        return res
    }
    
    func dfs(_ graph: inout [[Int]], _ dists: inout [Int], _ res: inout [[Int]], _ parent: Int, _ node: Int, _ depth: Int) -> Int {
        if dists[node] >= 0 { return dists[node] }
        dists[node] = depth
        
        var minDist = dists.count
        for next in graph[node] {
            if next == parent { continue }
            let dist = dfs(&graph, &dists, &res, node, next, depth + 1)
            if dist > depth { res.append([node, next]) }
            minDist = min(minDist, dist)
        }
        dists[node] = minDist
        return dists[node]
    }
}


var sol = Solution()
sol.criticalConnections(4, [[0,1],[1,2],[2,0],[1,3]])

