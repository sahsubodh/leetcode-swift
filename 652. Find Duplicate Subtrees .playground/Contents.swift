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
        var res:[TreeNode?] = []
        var map:[String:Int] = [:]
        helper(root, &res, &map)
        return res
    }
    
    func helper(_ root: TreeNode?, _ res: inout [TreeNode?], _ map: inout [String:Int]) -> String{
        guard let node = root else { return "#" }
        let text = node.val.description + "," + helper(node.left, &res, &map) + "," + helper(node.right, &res, &map)
        if map[text] == nil{
            map[text] = 1
        }else{
            if map[text] == 1{
                res.append(node)
                map[text]! += 1
            }
        }
        return text
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
