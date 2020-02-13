import UIKit

var str = "Hello, playground"

/*
 Given a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.

 Two trees are duplicate if they have the same structure with same node values.

 Example 1:

         1
        / \
       2   3
      /   / \
     4   2   4
        /
       4
 The following are two duplicate subtrees:

       2
      /
     4
 and

     4
 Therefore, you need to return above trees' root in the form of a list.
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
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        
        guard root != nil else {
            return []
        }
        
        var result:[TreeNode] = []
        var dict:[String:Int] = [:]
        postOrder(root!,dict,result)
        
        return result
    }
    
    private func postOrder(_ cur:TreeNode?,_ dict:[String:Int],_ result:[TreeNode])
    -> String {
        
        var result = result
        var dict = dict
        
        guard cur != nil else {
            return "#"
        }
        
        var serial = String(cur!.val) + ","  + postOrder(cur?.left!,dict,result) + ","
            + postOrder(cur?.right!,dict,result)
    
        if dict[serial,default:0] == 1 {
            result.append((cur)!)
        }
        
        dict[serial,default:0]  += 1
        return serial
    }
}

// public List<TreeNode> findDuplicateSubtrees(TreeNode root) {
//     List<TreeNode> res = new LinkedList<>();
//     postorder(root, new HashMap<>(), res);
//     return res;
// }

// public String postorder(TreeNode cur, Map<String, Integer> map, List<TreeNode> res) {
//     if (cur == null) return "#";
//     String serial = cur.val + "," + postorder(cur.left, map, res) + "," + postorder(cur.right, map, res);
//     if (map.getOrDefault(serial, 0) == 1) res.add(cur);
//     map.put(serial, map.getOrDefault(serial, 0) + 1);
//     return serial;
// }
