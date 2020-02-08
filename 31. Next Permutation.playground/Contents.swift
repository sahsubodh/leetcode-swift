import UIKit

var str = "Hello, playground"


/*
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

The replacement must be in-place and use only constant extra memory.

Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1
 
 eg 6 2 1 5 4 3 0 -> 6 2 3 0 1 4 5
 */


class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        
//        Grab the index of the 2nd to last element in the array

        var i = nums.count - 2
        
        /*
          Walk backwards. Keep walking until we reach the point right
          before the decreasing sequence begins. When this while loop
          ends that is where i will stand
        */
        while (i>=0 && nums[i] >= nums[i+1]){
            i -= 1
        }
        
        /*
          If i is not the first element we have more work to do
          
          If i IS the first element we just skip down to reverse
          the whole array since the WHOLE array would be decreasing
          meaning we are on our last permutation
        */
        if (i >= 0){
            var j = nums.count - 1
            /*
                 Start a pointer at the end of the array, we want to search for
                 the smallest item THAT IS GREATER THAN THE ELEMENT AT i
                 Why? Why Why Why. The reason why is that we want to know the
                 NEXT element that is to be planted where i is sitting. THIS
                 WILL ROOT THE NEXT PERMUTATION and represents the smallest change
                 we can make thus ensuring we have exactly the next permutation
               */
            while (j>=0 && nums[j] <= nums[i]){
                j -= 1
            }
            
            nums.swapAt(j, i)
        }
        
        /*
          Perform the reversal on the decreasing section now. We pass in i + 1
          since i sits RIGHT BEFORE the decreasing section that is on its final
          permutation
        */
        reverse(&nums, i+1)
        
        
    }
    
    func reverse(_ nums:inout [Int],_ start:Int){
        var left = start
        var right = nums.count - 1
        
        while (left<right){
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
        
    }
}
