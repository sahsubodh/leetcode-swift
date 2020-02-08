import UIKit
import Foundation

//  TwoSum

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */
func measure<T>(task: () -> T) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    task()
    let endTime = CFAbsoluteTimeGetCurrent()
    let result = endTime - startTime
    return result
}



func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    
    var count = nums.count;
    
    for i in 0...count-1
    {
        for j in i+1...count
        {
            if (nums[i]+nums[j] == target)
            {
                return [i,j];
            }
        }
    }
    
    
    
    return [];
}

// doesnt work for the input given
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    
    for (index,value) in nums.enumerated()
    {
        if let secondIndex = (nums.firstIndex(of: target - value))
        {
            return [index,secondIndex]
        }
    }
    
    
    return [];
}

func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
    
    
    var numsDict = [Int:Int](minimumCapacity: nums.count);
    
    for (index,value) in nums.enumerated()
    {
        if let secondIndex = numsDict[target-value] , secondIndex != index
        {
            return [index,secondIndex];
        }
        numsDict[value]=index;
    }
    
    
    return [];
}



let time = measure {
    twoSum1([2, 7, 11, 15], 9);
}

let time1 = measure {
    twoSum2([3,2,4], 6);
}

let time2 = measure {
    twoSum3([2, 7, 11, 15], 9);
}

print("Block is running \(time) seconds.")
print("Block is running \(time1) seconds.")
print("Block is running \(time2) seconds.")


