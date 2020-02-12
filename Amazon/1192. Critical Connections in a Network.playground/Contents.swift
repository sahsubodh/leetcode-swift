import UIKit

var str = "Hello, playground"


/*There are n servers numbered from 0 to n-1 connected by undirected server-to-server connections forming a network where connections[i] = [a, b] represents a connection between servers a and b. Any server can reach any other server directly or indirectly through the network.

A critical connection is a connection that, if removed, will make some server unable to reach some other server.

Return all critical connections in the network in any order.

 

Example 1:



Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
Output: [[1,3]]
Explanation: [[3,1]] is also accepted.
 

Constraints:

1 <= n <= 10^5
n-1 <= connections.length <= 10^5
connections[i][0] != connections[i][1]
There are no repeated connections.
 */


//https://leetcode.com/problems/critical-connections-in-a-network/discuss/382638/No-TarjanDFS-detailed-explanation-O(orEor)-solution-(I-like-this-question)

//DFS time complexity is O(|E| + |V|), attempting to visit each edge at most twice. (the second attempt will immediately return.)
//As the graph is always a connected graph, |E| >= |V|.
//
//So, time complexity = O(|E|).
//
//Space complexity = O(graph) + O(rank) + O(connections) = 3 * O(|E| + |V|) = O(|E|).
//
//FAQ: Are you reinventing Tarjan?
//Honestly, I didn't know Tarjan beforehand. The idea of using rank is inspired by preordering which is a basic concept of DFS. Now I realize they are similar, but there are still major differences between them.
//
//This solution uses only one array rank. While Tarjan uses two arrays: dfn and low.
//This solution's min_back_depth is similar to Tarjan's low, but rank is very different than dfn. max(dfn) is always n-1, while max(rank) could be smaller than n-1.
//This solution construsts the result by removing non-critical edges during the dfs, while Tarjan constructs the result by collecting non-critical edges after the dfs.
//In this solution, only nodes actively in the current search path have 0<=rank[node]<n; while in Tarjan, nodes not actively in the current search path may still have 0<=dfn[node]<=low[node]<n.
//Brain teaser
//Thanks @migfulcrum for pointing out that rank[node] = n is not necessary. He is totally right. I'll leave this as a brain teaser for you: why is it not necessary?
//(Hint: after we've finished visiting a node, is it possible to have another search path attempting to visit this node again?)



class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var indices: [Int] = Array(repeating: -1, count: n+1), lowLinks: [Int] = Array(repeating: 0, count: n+1)
        var graph: [[Int]] = Array(repeating: [], count: n+1), ans: [[Int]] = [], index: Int = 0

        for connection in connections {
            graph[connection[0]].append(connection[1])
            graph[connection[1]].append(connection[0])

        }
        
        for i in 0..<n where indices[i] == -1 {
            connect(i, &index, &lowLinks, &indices, graph, i, &ans)
        }
        
        var formattedOutput:[[Int]] = []
        
        // if connections have same edges then put it in same order as connections - MAY NOT BE NEEDED
        for connection in connections {
            if ans.contains(connection) {
                formattedOutput.append(connection)
            }
        }

        return formattedOutput
    }

    private func connect(_ u: Int, _ index: inout Int, _ lowLinks: inout [Int], _ indices: inout [Int], _ graph: [[Int]], _ parent: Int, _ ans: inout [[Int]]) {
        indices[u] = index
        lowLinks[u] = index
        index += 1

        for j in 0..<graph[u].count {
            let v: Int = graph[u][j]

            if v == parent {
                continue
            }

            if indices[v] == -1 {
                connect(v, &index, &lowLinks, &indices, graph, u, &ans)
                lowLinks[u] = min(lowLinks[u], lowLinks[v])

                if lowLinks[v] > indices[u] {
                    ans.append([u, v])
                }
            } else {
                lowLinks[u] = min(lowLinks[u], indices[v])
            }
        }
    }
}

var n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]

var n1 = 5, connections1 = [[1, 2], [1, 3], [3, 4], [1, 4], [4, 5]]

var n2 = 6, connections2 = [[1, 2], [1, 3], [2, 3], [2, 4], [2, 5], [4, 6], [5, 6]]

var n3 = 9, connections3 = [[1, 2], [1, 3], [2, 3], [3, 4], [3, 6], [4, 5], [6, 7], [6, 9], [7, 8], [8, 9]]

var sol = Solution()
sol.criticalConnections(n, connections)
sol.criticalConnections(n1, connections1)
sol.criticalConnections(n2, connections2)
sol.criticalConnections(n3, connections3)
