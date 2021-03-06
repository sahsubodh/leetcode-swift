import UIKit

var str = "Hello, playground"

/*Design a data structure that supports all following operations in average O(1) time.

Note: Duplicate elements are allowed.
insert(val): Inserts an item val to the collection.
remove(val): Removes an item val from the collection if present.
getRandom: Returns a random element from current collection of elements. The probability of each element being returned is linearly related to the number of same value the collection contains.
Example:

// Init an empty collection.
RandomizedCollection collection = new RandomizedCollection();

// Inserts 1 to the collection. Returns true as the collection did not contain 1.
collection.insert(1);

// Inserts another 1 to the collection. Returns false as the collection contained 1. Collection now contains [1,1].
collection.insert(1);

// Inserts 2 to the collection, returns true. Collection now contains [1,1,2].
collection.insert(2);

// getRandom should return 1 with the probability 2/3, and returns 2 with the probability 1/3.
collection.getRandom();

// Removes 1 from the collection, returns true. Collection now contains [1,2].
collection.remove(1);

// getRandom should return 1 and 2 both equally likely.
collection.getRandom();
 */


class RandomizedCollection {
    
    var dict:[Int:Set<Int>] = [:]
    var arr:[Int] = []
 
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        let newInsert = (dict[val] == nil)
        dict[val,default:[]].insert(arr.count)
        arr.append(val)
        return newInsert
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if dict[val] != nil {
            var index = dict[val]!.first!
            dict[val]?.remove(index)
            if dict[val]!.isEmpty {
               dict[val] = nil
            }
            
            let last = arr.removeLast()
            let lastIndex = arr.count
            if lastIndex != index {
                arr[index] = last
                dict[last]!.remove(lastIndex)
                dict[last]!.insert(index)
            }
            
            
         
            return true
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return arr.randomElement()!
    }
}
