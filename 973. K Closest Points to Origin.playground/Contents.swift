import UIKit

var str = "Hello, playground"

/*
 We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

 (Here, the distance between two points on a plane is the Euclidean distance.)

 You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

  

 Example 1:

 Input: points = [[1,3],[-2,2]], K = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:

 Input: points = [[3,3],[5,-1],[-2,4]], K = 2
 Output: [[3,3],[-2,4]]
 (The answer [[-2,4],[3,3]] would also be accepted.)
  

 Note:

 1 <= K <= points.length <= 10000
 -10000 < points[i][0] < 10000
 -10000 < points[i][1] < 10000
 */


class Solution {
    
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        
        var result:[[Int]] = []
        
        guard points.count > 0 else {
            return result
        }
        
        return quickselect(points,0,points.count-1,K-1)
    }
    
    func quickselect(_ points: [[Int]], _ start: Int, _ end: Int, _ K: Int) -> [[Int]]{
        
        let pivot = value(points[end])
        var points = points
        var left = start
        
        for i in start..<end{
            if value(points[i]) <= pivot {
                
                if left != i {
                    points.swapAt(i, left)
                }
                
                left += 1
            }
            
        }
        
        points.swapAt(end, left)
        
        if left == K {
            return Array(points[0...left])
        } else if left < K {
            return quickselect(points, left + 1, end, K)
        } else {
            return quickselect(points, start, left - 1 , K)
        }
        
        
    }
    
    func value(_ val:[Int]) -> Int {
        return val.first! * val.first! + val.last! * val.last!
    }
}






