import UIKit

var str = "Hello, playground"


/*
 
 Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to find the number of connected components in an undirected graph.

 Example 1:

 Input: n = 5 and edges = [[0, 1], [1, 2], [3, 4]]

      0          3
      |          |
      1 --- 2    4

 Output: 2
 Example 2:

 Input: n = 5 and edges = [[0, 1], [1, 2], [2, 3], [3, 4]]

      0           4
      |           |
      1 --- 2 --- 3

 Output:  1
 Note:
 You can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
 */


class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
            var graph: [Int: [Int]] = [:]
            for edge in edges {
                graph[edge[0], default: []].append(edge[1])
                graph[edge[1], default: []].append(edge[0])
            }
            
            var visited: Set<Int> = []
            var ans: Int = 0
            
            // DFS
            for node in 0..<n {
                guard !visited.contains(node) else { continue }
                visited.insert(node)
                dfs(graph, node, &visited)
                ans += 1
            }
            return ans
        }
        
        private func dfs(_ graph: [Int: [Int]], _ curr: Int, _ visited: inout Set<Int>) {
            guard let nexts = graph[curr] else { return }
            for next in nexts {
                guard !visited.contains(next) else { continue }
                visited.insert(next)
                dfs(graph, next, &visited)
            }
        }
}
