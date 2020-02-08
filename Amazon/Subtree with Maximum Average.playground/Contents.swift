import UIKit

var str = "Hello, playground"

/*(Given an N-ary tree, find the subtree with the maximum average. Return the root of the subtree.
A subtree of a tree is the node which have at least 1 child plus all its descendants. The average value of a subtree is the sum of its values, divided by the number of nodes.

Example 1:

Input:
         20
       /   \
     12     18
  /  |  \   / \
11   2   3 15  8

Output: 18
Explanation:
There are 3 nodes which have children in this tree:
12 => (11 + 2 + 3 + 12) / 4 = 7
18 => (18 + 15 + 8) / 3 = 13.67
20 => (12 + 11 + 2 + 3 + 18 + 15 + 8 + 20) / 8 = 11.125

18 has the maximum average so output 18.
Similar questions:

https://leetcode.com/problems/maximum-average-subtree*/


/**
 * Definition for a binary tree node. */
  public class TreeNode {
      public var val: Int
      public var children: [TreeNode]?
      public init(_ val: Int) {
          self.val = val
          self.children = nil
      }
  }
 


class Solution {
    var maxVal:Double = Double(Int.min)
    var maxNode:TreeNode?
    
  func maximumAverageSubtree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
    
        helper(root)
        return maxNode
    }
    
    private func helper(_ root: TreeNode?) -> [Double] {
           if root == nil {
               return [0,0] // sum, count
           }
        
        var curTotal:Double = Double(root!.val)
        var count:Double = 1
    
        for child in root!.children! {
            let cur = helper(child)
            curTotal += cur[0]
            count += cur[1]
        }
        
        var avg:Double = curTotal/count
        if count > 1 && avg > maxVal { //taking "at least 1 child" into account
            maxVal = avg
            maxNode = root
        }
        
        return [curTotal,count]
           
       }

}

