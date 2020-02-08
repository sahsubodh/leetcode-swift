import UIKit


/*
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
[-1, 0, 1],
[-1, -1, 2]
]

*/


func measure<T>(task: () -> T) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    task()
    let endTime = CFAbsoluteTimeGetCurrent()
    let result = endTime - startTime
    return result
}

// time exceeded
func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var resultArr = Set<[Int]>();
    let count = nums.count - 1;
    
    if (nums.count < 3)
    {
        return [];
    }
    
    for i in 0...count-2
    {
        for j in i+1...count-1
        {
            for k in j+1...count
            {
                
                if (nums[i]+nums[j]+nums[k] == 0 && nums[i] != nil && nums[j] != nil && nums[k] != nil)
                {
                    var tempArr = [nums[i],nums[j],nums[k]].sorted();
                    resultArr.insert(tempArr);
                }
            }
        }
    }

    print(resultArr);
    return Array(resultArr);
}


func threeSum1(_ nums: [Int]) -> [[Int]] {
    
    var resultArr = Set<[Int]>();
    let count = nums.count - 1;
    
    if (nums.count < 3)
    {
        return [];
    }
    
    for i in 0...count-2
    {
        var j = i+1 , k = count
        while (j<k)
        {
            if (nums[i]+nums[j]+nums[k] == 0 && nums[i] != nil && nums[j] != nil && nums[k] != nil)
            {
                let tempArr = [nums[i],nums[j],nums[k]].sorted();
                resultArr.insert(tempArr);
            }
            
            j = j+1;
            k = k-1;
        }
    }
    
    print(resultArr);
    return Array(resultArr);
}



let time = measure {
    threeSum([-1, 0, 1, 2, -1, -4]);
}

let time1 = measure {
    threeSum1([-1, 0, 1, 2, -1, -4]);
}
print("Block is running \(time) seconds.")
print("Block is running \(time1) seconds.")


/*You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807. */


public class ListNode {
         public var val: Int
         public var next: ListNode?
         public init(_ val: Int) {
         self.val = val
         self.next = nil
        }
     }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ln = new ListNode(0);
        
        return ln;
    }
}
