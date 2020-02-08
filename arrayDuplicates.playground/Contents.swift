import UIKit

var str = "Hello, playground"


class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if (nums.count == 0)
        {
            return 0
        }
        var i = 0
        var j=1
        while (j<nums.count) {
            if (nums[j] != nums[i]){
                i += 1;
                nums[i] = nums[j];
            }
            
            j += 1;
        }
        return i+1;
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else
        {
            return 0;
        }
        
        var maxProfit = 0
        for i in 0..<prices.count-1{
            for j in i+1..<prices.count{
                let profit = prices[j] - prices[i]
                if (maxProfit < profit)
                {
                    maxProfit = profit
                }
            }
        }
        return maxProfit
    }
    
    func maxProfit1 (_ prices: [Int]) -> Int {
        var minprice = Int.max
        var maxProfit = 0
        for i in 0..<prices.count{
            if prices[i] < minprice {
                minprice = prices[i];
            } else if (prices[i] - minprice > maxProfit)
            {
                maxProfit = prices[i] - minprice
            }
        }
        return maxProfit
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count < 2 || k < 1
            {
                   
            } else {
                for _ in 1...k{
                    let lastNum  = nums.removeLast()
                    nums.insert(lastNum, at: 0)
                }
            }
    }
    
    func rotate1(_ nums: inout [Int], _ k: Int) {
        if nums.count < 2 || k < 1
        {

        } else
        {
        var reverse_nums = Array(repeating: 0, count: nums.count)

            for i in 0...nums.count-1{
                print((i+k)%nums.count)
                reverse_nums[(i+k)%nums.count] = nums[i]
            }
            nums = reverse_nums
        }
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        
        var numSet:Set<Int> = Set();
        for i in 0..<nums.count{
            numSet.insert(nums[i])
        }
        
        return nums.count != numSet.count
      }
    
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0..<nums.count{
            result ^= nums[i]
        }
        return result
     }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
     
        var resultArr:[Int] = [];
        for i in 0..<nums2.count{
            for j in 0..<nums1.count{
                if (nums1[j]==nums2[i])
                {
                    resultArr.append(nums1[i])
                }
            }
        }
        return resultArr
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        
        if (nums.count > 1)
        {
            var countZero = 0
            for i in 0..<nums.count{
                if (nums[i] == 0)
                {
                    countZero += 1
                }
            }
            
            var resNums:[Int] = []
            
            for i in 0..<nums.count{
                if (nums[i] != 0)
                {
                    resNums.append(nums[i])
                }
            }
            
            for i in 0..<countZero{
                resNums.append(0)
            }
            
            nums = resNums
            
        } else
        {
            
        }

     }
    
    func moveZeroes1(_ nums: inout [Int]) {
        
        if (nums.count > 1)
        {
            var nonDuplicates = 0
            for i in 0..<nums.count{
                if nums[i] != 0
                {
                    nums[nonDuplicates] = nums[i]
                    nonDuplicates += 1
                }
            }
            for i in nonDuplicates..<nums.count{
                nums[i] = 0
            }
            
        } else
        {
            
        }

     }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var dict:[Int:Int] = [:]
        for (index,value) in nums.enumerated()
        {
            if let secondIndex = dict[target-value] , secondIndex != index
            {
                return [index,secondIndex]
            }
            dict[value] = index
        }
        return []
    }
}

var arr = [1,1,2]

var sol = Solution()
//sol.removeDuplicates(&arr)
//
//var profit = sol.maxProfit1([7,1,5,3,6,4])
//print(profit)
//
//var profit1 = sol.maxProfit1([7,6,4,3,1])
//print(profit1)

//var arr1:[Int] = [1,2] //[5,6,7,1,2,3,4]
//sol.rotate1(&arr1,0)
//print(arr1)

//var result = sol.singleNumber([4,1,2,1,2])
//print(result)

//var result = sol.intersect([1,2,2,1], [2,2])
//print(result)

var arr2 = [0,0,1]//[0,1,0,3,12] 0,0,1
sol.moveZeroes1(&arr2)
print(arr2)

var result = sol.twoSum([2, 7, 11, 15],9)
print(result)
