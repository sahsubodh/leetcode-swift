import UIKit

var str = "Hello, playground"


/*Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

Examples 1:

Input: [3,9,20,null,null,15,7]

   3
  /\
 /  \
 9  20
    /\
   /  \
  15   7

Output:

[
  [9],
  [3,15],
  [20],
  [7]
]
Examples 2:

Input: [3,9,8,4,0,1,7]

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7

Output:

[
  [4],
  [9],
  [3,0,1],
  [8],
  [7]
]
Examples 3:

Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)

     3
    /\
   /  \
   9   8
  /\  /\
 /  \/  \
 4  01   7
    /\
   /  \
   5   2

Output:

[
  [4],
  [9,5],
  [3,0,1],
  [8,2],
  [7]
]
 */


/**
 * Definition for a binary tree node. */
  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
 


class Solution {
    
     func verticalOrder(_ root: TreeNode?) -> [[Int]] {
           guard let root = root else {
               return [[Int]]()
           }
           var columns = [Int: [Int]]()
           
           var s = 0
           var b = 0
           var queue = [(TreeNode, Int)]()
           queue.append((root, 0))
           while !queue.isEmpty {
               var size = queue.count
               while size > 0 {
                   let entry = queue.removeFirst()
                   columns[entry.1, default: [Int]()].append(entry.0.val)
                   if let left = entry.0.left {
                       queue.append((left, entry.1 - 1))
                   }
                   if let right = entry.0.right {
                       queue.append((right, entry.1 + 1))
                   }
                   size -= 1
                   s = min(s, entry.1)
                   b = max(b, entry.1)
               }
           }
           var res = [[Int]]()
           for i in s...b {
               res.append(columns[i]!)
           }
           return res
       }
    
    
    //TLE
    func verticalOrder1(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return [[]]
        }
        
        var queue:[TreeNode] = []
        var col:[Int] = []
        var map:[Int:[Int]] = [:]
        
        queue.append(root!)
        col.append(0)
        
        var maxval = 0
        var minval = 0
        
        var result:[[Int]] = []
        
        while !queue.isEmpty {
            var node = queue.removeFirst()
            var curcol = col.removeFirst()
            
            map[curcol] = map[curcol,default: []] + [ node.val ]
            
            if node.left != nil {
                queue.append(node)
                col.append(curcol - 1)
                minval = min(minval, curcol - 1)
            }
            
            if node.right != nil {
                queue.append(node)
                col.append(curcol + 1)
                minval = min(minval, curcol + 1)
            }
        }
        
        for i in minval..<maxval+1{
            result.append(map[i]!)
        }
     
        return result
    }
}

