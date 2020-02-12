import UIKit

var str = "Hello, playground"


//https://leetcode.com/discuss/interview-question/436073/


/*
 You are given an undirected connected graph. An articulation point (or cut vertex) is defined as a vertex which, when removed along with associated edges, makes the graph disconnected (or more precisely, increases the number of connected components in the graph). The task is to find all articulation points in the given graph.

 Input:
 The input to the function/method consists of three arguments:

 numNodes, an integer representing the number of nodes in the graph.
 numEdges, an integer representing the number of edges in the graph.
 edges, the list of pair of integers - A, B representing an edge between the nodes A and B.
 Output:
 Return a list of integers representing the critical nodes.

 Example:

 Input: numNodes = 7, numEdges = 7, edges = [[0, 1], [0, 2], [1, 3], [2, 3], [2, 5], [5, 6], [3, 4]]


 Output: [2, 3, 5]
 Related problems:

 Critical Connections
 https://www.geeksforgeeks.org/articulation-points-or-cut-vertices-in-a-graph/
 https://cp-algorithms.com/graph/cutpoints.html
 */

//articulation point if
//1) u is root of DFS tree and it has at least two children.
//2) u is not root of DFS tree and it has a child v such that no vertex in subtree rooted with v has a back edge to one of the ancestors (in DFS tree) of u.


//DFS time complexity is O(|E| + |V|), attempting to visit each edge at most twice. (the second attempt will immediately return.)
//As the graph is always a connected graph, |E| >= |V|.
//
//So, time complexity = O(|E|).
//
//Space complexity = O(graph) + O(rank) + O(connections) = 3 * O(|E| + |V|) = O(|E|).


class Solution {
    
    func getCriticalNodes(_ numNodes: Int,_ numEdges: Int, _ edges: [[Int]]) -> [Int] {

        var indices: [Int] = Array(repeating: -1, count: numNodes), lowLinks: [Int] = Array(repeating: 0, count: numNodes)
        var graph: [[Int]] = Array(repeating: [], count: numNodes), ans: [Int] = [], index: Int = 0

        for connection in edges {
            graph[connection[0]].append(connection[1])
            graph[connection[1]].append(connection[0])
        }
        
        for i in 0..<numNodes where indices[i] == -1 {
            findPoints(i, &index, &lowLinks, &indices, graph, i, &ans)
        }
        return ans
    }
    
    private func findPoints(_ u: Int, _ index: inout Int, _ lowLinks: inout [Int], _ indices: inout [Int], _ graph: [[Int]], _ parent: Int, _ ans: inout [Int]) {
        
         indices[u] = index
         lowLinks[u] = index
         index += 1
        var children = 0

         for j in 0..<graph[u].count {
             let v: Int = graph[u][j]

            if v == parent {
                continue
            }
            
             if indices[v] == -1 {
                children += 1
            
                 findPoints(v, &index, &lowLinks, &indices, graph, u, &ans)
                 lowLinks[u] = min(lowLinks[u], lowLinks[v])
                
                if ((parent == u && children > 1) || (parent != -1 && lowLinks[v] > indices[u])) {
                    ans.append(u)
                }


             } else  {
                 lowLinks[u] = min(lowLinks[u], indices[v])
             }
         }
        
    }
    
    
//
}

//var n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
//
//var n1 = 5, connections1 = [[1, 2], [1, 3], [3, 4], [1, 4], [4, 5]]
//
//var n2 = 6, connections2 = [[1, 2], [1, 3], [2, 3], [2, 4], [2, 5], [4, 6], [5, 6]]
//
//var n3 = 9, connections3 = [[1, 2], [1, 3], [2, 3], [3, 4], [3, 6], [4, 5], [6, 7], [6, 9], [7, 8], [8, 9]]
//
//var sol = Solution()
//sol.criticalConnections(n, connections)
//sol.criticalConnections(n1, connections1)
//sol.criticalConnections(n2, connections2)
//sol.criticalConnections(n3, connections3)


var sol = Solution()

sol.getCriticalNodes(7, 7, [[0, 1], [0, 2], [1, 3], [2, 3], [2, 5], [5, 6], [3, 4]])




// func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
//        var indices: [Int] = Array(repeating: -1, count: n+1), lowLinks: [Int] = Array(repeating: 0, count: n+1)
//        var graph: [[Int]] = Array(repeating: [], count: n+1), ans: [[Int]] = [], index: Int = 0
//
//        for connection in connections {
//            graph[connection[0]].append(connection[1])
//            graph[connection[1]].append(connection[0])
//
//        }
//
//        for i in 0..<n where indices[i] == -1 {
//            connect(i, &index, &lowLinks, &indices, graph, i, &ans)
//        }
//
//        var formattedOutput:[[Int]] = []
//
//        // if connections have same edges then put it in same order as connections - MAY NOT BE NEEDED
//        for connection in connections {
//            if ans.contains(connection) {
//                formattedOutput.append(connection)
//            }
//        }
//
//        return formattedOutput
//    }
//
//    private func connect(_ u: Int, _ index: inout Int, _ lowLinks: inout [Int], _ indices: inout [Int], _ graph: [[Int]], _ parent: Int, _ ans: inout [[Int]]) {
//        indices[u] = index
//        lowLinks[u] = index
//        index += 1
//
//        for j in 0..<graph[u].count {
//            let v: Int = graph[u][j]
//
//            if v == parent {
//                continue
//            }
//
//            if indices[v] == -1 {
//                connect(v, &index, &lowLinks, &indices, graph, u, &ans)
//                lowLinks[u] = min(lowLinks[u], lowLinks[v])
//
//                if lowLinks[v] > indices[u] {
//                    ans.append([u, v])
//                }
//            } else {
//                lowLinks[u] = min(lowLinks[u], indices[v])
//            }
//        }
//    }
