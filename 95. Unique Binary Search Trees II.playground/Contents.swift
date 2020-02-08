import UIKit

var str = "Hello, playground"

/*Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.

Example:

Input: 3
Output:
[
  [1,null,3,2],
  [3,2,null,1],
  [3,1,null,null,2],
  [2,1,3],
  [1,null,2,null,3]
]
Explanation:
The above output corresponds to the 5 unique BST's shown below:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3*/


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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        
        return generate_tree(start: 1, end: n)
    }
    
    func generate_tree(start:Int,end:Int) -> [TreeNode?]{
        
        var result:[TreeNode?] = []
        
        if (start>end){
            result.append(nil)
            return result;
        }
        
        for i in start...end{
            let left_trees:[TreeNode?] = generate_tree(start: start, end: i-1)
            let right_trees:[TreeNode?] = generate_tree(start: i+1, end: end)
            
            for left in left_trees{
                for right in right_trees{
                    let current_node = TreeNode(i)
                    current_node.left = left
                    current_node.right = right
                    result.append(current_node)
                }
            }
        }
        
        return result
    }
}
