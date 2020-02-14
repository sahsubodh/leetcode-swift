import UIKit

var str = "Hello, playground"


/*
 Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.

 You need to help them find out their common interest with the least list index sum. If there is a choice tie between answers, output all of them with no order requirement. You could assume there always exists an answer.

 Example 1:
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
 Output: ["Shogun"]
 Explanation: The only restaurant they both like is "Shogun".
 Example 2:
 Input:
 ["Shogun", "Tapioca Express", "Burger King", "KFC"]
 ["KFC", "Shogun", "Burger King"]
 Output: ["Shogun"]
 Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
 Note:
 The length of both lists will be in the range of [1, 1000].
 The length of strings in both lists will be in the range of [1, 30].
 The index is starting from 0 to the list length minus 1.
 No duplicates in both lists.
 */


class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        
        var dict:[String:Int] = [:]
        var list2 = list2
        var list1 = list1
        
        for i in 0..<list2.count {
            dict[list2[i]] = i
        }
        
        var minIndexsum = Int.max
        var result:[String] = []
         
        for j in 0..<list1.count {
            if dict[list1[j]] != nil {
                var indexsum = j + dict[list1[j]]!
                
                if indexsum <= minIndexsum {
                    if (indexsum < minIndexsum){
                        result.removeAll()
                        minIndexsum = j + dict[list1[j]]!
                    }
                    result.append(list1[j])
                }
            }
        }
        
        return result
        
    }
}
