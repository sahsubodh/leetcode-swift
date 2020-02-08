import UIKit

var str = "Hello, playground"


/*Given a matrix of integers A with R rows and C columns, find the maximum score of a path starting at [0,0] and ending at [R-1,C-1].

The score of a path is the minimum value in that path.  For example, the value of the path 8 →  4 →  5 →  9 is 4.

A path moves some number of times from one visited cell to any neighbouring unvisited cell in one of the 4 cardinal directions (north, east, west, south).

 

Example 1:



Input: [[5,4,5],[1,2,6],[7,4,6]]
Output: 4
Explanation:
The path with the maximum score is highlighted in yellow.
Example 2:



Input: [[2,2,1,2,2,2],[1,2,2,2,1,2]]
Output: 2
Example 3:



Input: [[3,4,6,3,4],[0,2,1,1,7],[8,8,3,2,7],[3,2,4,9,8],[4,1,2,0,0],[4,6,5,4,3]]
Output: 3
 

Note:

1 <= R, C <= 100
0 <= A[i][j] <= 10^9*/


class Solution {
    var heap = MinimumHeap()
    
    
    func maximumMinimumPath(_ A: [[Int]]) -> Int {
        
        let dirs = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        
        heap.enqueue([A[0][0],0,0])
        
        var visited = Set<[Int]>()
        visited.insert([0,0])
        
        let row = A.count - 1
        let col = A[0].count - 1
        
        var minValue = A[0][0]
        
        while heap.size() > 0 {
            let node = heap.dequeue()
            minValue = min(minValue,node![0])
            
            if node![1] == row && node![2] == col {
                return minValue
            }
            
            for dir in dirs {
                let newdir = [node![1] + dir[0],node![2]+dir[1]]
                if !visited.contains(newdir) , newdir[0] >= 0, newdir[1] >= 0, newdir[0] <= row, newdir[1] <= col {
                    visited.insert(newdir)
                    heap.enqueue([A[newdir[0]][newdir[1]] , newdir[0] ,newdir[1]])
                }
            }
        }
        return -1
    }
}


class MinimumHeap{
    
    private var heap:[[Int]] = []
    
    func size() -> Int {
        return heap.count
    }
    
    func enqueue(_ node:[Int]) {
        heap.append(node)
        var curr = heap.count - 1
        while curr > 0 {
            let parent = (curr - 1)/2
            if heap[parent][0] > heap[curr][0] {
                heap.swapAt(curr, parent)
                curr = parent
            } else {
                break
            }
        }
    }
    
    func dequeue() -> [Int]?{
        guard heap.count > 0 else { return nil }
        
        let first = heap[0]
        let last = heap.removeLast()
        
        if heap.count > 0 {
            heap[0] = last
            var curr = 0
            while curr < heap.count {
                let next:Int
                let left = curr * 2 + 1 , right = curr * 2 + 2
                if right < heap.count{
                    next = (heap[left][0] < heap[right][0] ? left :right)
                } else if left < heap.count {
                    next = left
                } else {
                    break
                }
                
                if heap[curr][0] > heap[next][0] {
                    heap.swapAt(curr, next)
                    curr = next
                } else {
                    break;
                }
            }
        }
        return first
    }
}


var sol = Solution()
sol.maximumMinimumPath([[5,4,5],[1,2,6],[7,4,6]])
