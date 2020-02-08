import UIKit

var str = "Hello, playground"


/*
 Given an undirected graph with n nodes labeled 1..n. Some of the nodes are already connected. The i-th edge connects nodes edges[i][0] and edges[i][1] together. Your task is to augment this set of edges with additional edges to connect all the nodes. Find the minimum cost to add new edges between the nodes such that all the nodes are accessible from each other.

 Input:

 n, an int representing the total number of nodes.
 edges, a list of integer pair representing the nodes already connected by an edge.
 newEdges, a list where each element is a triplet representing the pair of nodes between which an edge can be added and the cost of addition, respectively (e.g. [1, 2, 5] means to add an edge between node 1 and 2, the cost would be 5).
 Example 1:

 Input: n = 6, edges = [[1, 4], [4, 5], [2, 3]], newEdges = [[1, 2, 5], [1, 3, 10], [1, 6, 2], [5, 6, 5]]
 Output: 7
 Explanation:
 There are 3 connected components [1, 4, 5], [2, 3] and [6].
 We can connect these components into a single component by connecting node 1 to node 2 and node 1 to node 6 at a minimum cost of 5 + 2 = 7.
 Solution
 Java solution using Kruskal's MST algorithm: https://leetcode.com/playground/7d5AeuFc
 */



class Solution {
    
    var parent:[Int] = []
    var unvisitedCities = 0
    var edgesToRepair :[[Int]] = []
    
    func setParent(for x:Int,and y:Int) {
        let parentofX = findParent(of: x)
        let parentofY = findParent(of: y)
        
        if parentofX != parentofY {
            parent[parentofX] = parentofY
            unvisitedCities -= 1
        }
    }
    
    func findParent(of x:Int) -> Int {
        if parent[x] == x {
            return parent[x]
        }
        
        parent[x] = findParent(of: parent[x])
        return parent[x]
    }
    
    func minCosttoConnectAllNodes(_ N: Int, _ edges: [[Int]],_ newEdges:[[Int]]) -> Int {
        
        var cost = 0
        unvisitedCities = N
         
        //initially set parent to self
        for i in 0...N {
            parent.append(i)
        }
        
        for edge in edges {
        
            let cityOne = edge[0], cityTwo = edge[1]
            if findParent(of: cityOne) != findParent(of: cityTwo) {
                setParent(for: cityOne, and: cityTwo)
            }
        }
        
        // sort the new edges asc by weight
        var newEdges = newEdges
        newEdges.sort{ $0[2] < $1[2] }
        
        
        //add new edge
        for edge in newEdges {
            let cityOne = edge[0], cityTwo = edge[1]
            if findParent(of: cityOne) != findParent(of: cityTwo) {
                setParent(for: cityOne, and: cityTwo)
                cost += edge[2]
                if unvisitedCities == 1 {
                    return cost
                }
            }
        }
        return -1
    }
    
    func minimumCost(_ N: Int, _ connections: [[Int]]) -> Int {
        
        unvisitedCities = N
        
        //initially set parent to self
        for i in 0...N {
            parent.append(i)
        }
        
        // sort the connection asc by weight
        var connections = connections
        connections.sort{ $0[2] < $1[2] }
        
        var distanceTravelled = 0
        
        // choose the min weight each time and see if it connects more sets
        for path in connections{
            let cityOne = path[0] , cityTwo = path[1]

            if findParent(of: cityOne) != findParent(of: cityTwo) {
                distanceTravelled += path[2]
                setParent(for: cityOne, and: cityTwo)
            }
        }
        
        return unvisitedCities == 1 ? distanceTravelled : -1
    }
    
    func isSameEdge(_ edge1:[Int],_ edge2:[Int]) -> Bool {
           return (edge1[0] == edge2[0] && edge1[1] == edge2[1])
                   
       }
       
       func isEdgeToRepair(_ edge1:[Int]) -> Bool {
           for edge in edgesToRepair {
               if isSameEdge(edge,edge1) {
                   return true
               }
               
           }
           return false
       }
    
    func minCosttoRepairAllNodes(_ N: Int, _ edges: [[Int]],_ edgesToRepair:[[Int]]) -> Int {
           var cost = 0
           unvisitedCities = N
            
           //initially set parent to self
           for i in 0...N {
               parent.append(i)
           }
           
           self.edgesToRepair = edgesToRepair
           self.edgesToRepair.sort { $0[2] < $1[2]  }
           
           
           for edge in edges {
               if (!isEdgeToRepair(edge))
               {
                   let cityOne = edge[0], cityTwo = edge[1]
                   if findParent(of: cityOne) != findParent(of: cityTwo) {
                       setParent(for: cityOne, and: cityTwo)
                   }
               }
           }
        
        //add new edge
            for edge in self.edgesToRepair {
                   let cityOne = edge[0], cityTwo = edge[1]
                   if findParent(of: cityOne) != findParent(of: cityTwo) {
                       setParent(for: cityOne, and: cityTwo)
                       cost += edge[2]
                       if unvisitedCities == 1 {
                           return cost
                       }
                   }
               }
        
           
           return -1
       }
}


//var edges = [[1, 4], [4, 5], [2, 3]]
//var newEdges = [[1, 2, 5], [1, 3, 10], [1, 6, 2], [5, 6, 5]]
//
var sol = Solution()
//sol.minCosttoConnectAllNodes(6, edges,newEdges)

var n = 6
//var edges1 = [[1, 2], [2, 3], [4, 5], [3, 5], [1, 6], [2, 4]]
//var edgesToRepair1 = [[1, 6, 410], [2, 4, 800]]
//
//sol.minCosttoRepairAllNodes(n, edges1,edgesToRepair1)


//var edges2 = [[1, 2], [2, 3], [4, 5], [5, 6], [1, 5], [2, 4], [3, 4]]
//var edgesToRepair2 = [[1, 5, 110], [2, 4, 84], [3, 4, 79]]

//sol.minCosttoRepairAllNodes(n, edges2,edgesToRepair2)


var edges3 = [[1, 2], [2, 3], [3, 4], [4, 5], [1, 5]]
var edgesToRepair3 = [[1, 2, 12], [3, 4, 30], [1, 5, 8]]


sol.minCosttoRepairAllNodes(5, edges3,edgesToRepair3)

