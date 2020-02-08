import UIKit

var str = "Hello, playground"
func threeSum(_ nums: [Int]) -> [[Int]] {
    
    guard  nums.count > 2 else {
        return []
    }
    
            let nums = nums.sorted()
           var result = [[Int]]()
           var start = 0
           var end = 0
           var sum = 0
           
           for i in 0..<(nums.count - 2) {
               if i == 0 || (i > 0 && nums[i] != nums[i - 1]) {
                   start = i + 1
                   end = nums.count - 1
                   sum = -nums[i]
                   while start < end {
                       if nums[start] + nums[end] == sum {
                           result.append([nums[i], nums[start], nums[end]])
                           while start < end && nums[start] == nums[start + 1] {
                               start += 1
                           }
                           while start < end && nums[end] == nums[end - 1] {
                               end -= 1
                           }
                           start += 1
                           end -= 1
                       } else if nums[start] + nums[end] < sum {
                           start += 1
                       } else {
                           end -= 1
                       }
                   }
               }
           }
           
           return result
}


func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    guard nums1.count > 0 && nums2.count > 0 else {
        return []
    }
   
    
    var set1 = Set(nums1)
    var set2 = Set(nums2)
    
    var result:[Int] = []
    
    for i in set1{
        if set2.contains(i)
        {
            result.append(i)
        }
    }
    
    
    return result
   
}


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    guard nums1.count > 0 && nums2.count > 0 else {
        return []
    }
    
    var result: [Int] = []
//
//        if (nums1.count == 1)
//        {
//            if nums2.contains(nums1[0])
//            {
//                return nums1
//            }
//        }
//
//        if (nums2.count == 1)
//        {
//            if nums1.contains(nums2[0])
//            {
//                return nums2
//            }
//        }
//
//    var input1 = nums1
//    var input2 = nums2
//
//    input1.sort()
//    input2.sort()
//
//    var startIndex1 = 0
//    var startIndex2 = 0
//
//    while (startIndex1 < input1.count  && startIndex2 < input2.count )
//    {
//        if (input1[startIndex1] == input2[startIndex2]){
//            result.append(input1[startIndex1]);
//            startIndex1 += 1;
//            startIndex2 += 1;
//        } else if (input1[startIndex1] > input2[startIndex2])
//        {
//            startIndex2 += 1
//        }
//        else{
//            startIndex1 += 1
//        }
//    }
//
    
        var dict: [Int:Int] = [:]
    
        for i in nums1{
            if var count = dict[i]{
                count += 1
                dict[i] = count
            }else{
                dict[i] = 1
            }
        }
    
    for j in nums2{
        if var count = dict[j],count>0{
            dict[j] = count - 1
            result.append(j)
        }
    }
    
        return result

    
//    if (nums1.count == 1)
//    {
//        if nums2.contains(nums1[0])
//        {
//            return nums1
//        }
//    }
//
//    if (nums2.count == 1)
//    {
//        if nums1.contains(nums2[0])
//        {
//            return nums2
//        }
//    }
//
//    for i in 0...nums1.count-1{
//        for j in 0...nums2.count-1{
//            if nums1[i] == nums2[j]
//            {
//                result.append(nums1[i])
//            }
//        }
//    }
//
//
}


//var inputarray = [-2,0,1,1,2]
//
//var res = threeSum(inputarray)
//print(res)


var nums1 = [4,9,5]
var nums2 = [9,4,9,8,4]
//var result = intersection(nums1, nums2)

var result = intersect(nums1, nums2)
print(result)


func isMonotonic(_ A: [Int]) -> Bool {
    
    guard A.count > 2 else {
        return true
    }

    
    var increasing = true
    var decreasing = true
    
    var startIndex = 0
    
    
    while startIndex < A.count - 1 {
        if (A[startIndex+1] < A[startIndex])
        {
            increasing = false
        }
        
        if (A[startIndex+1] > A[startIndex])
        {
            decreasing = false
        }
        startIndex += 1
    }
    
    return increasing || decreasing
}


var array:[Int] = [ ]
var r = isMonotonic(array)
print(r)
