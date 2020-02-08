import UIKit

var str = "Hello, playground"

/*Given a nested list of integers, implement an iterator to flatten it.

Each element is either an integer, or a list -- whose elements may also be integers or other lists.

Example 1:

Input: [[1,1],2,[1,1]]
Output: [1,1,2,1,1]
Explanation: By calling next repeatedly until hasNext returns false,
             the order of elements returned by next should be: [1,1,2,1,1].
Example 2:

Input: [1,[4,[6]]]
Output: [1,4,6]
Explanation: By calling next repeatedly until hasNext returns false,
             the order of elements returned by next should be: [1,4,6].*/


/**
 * // This is the interface that allows for creating nested lists.
  // You should not implement it, or speculate about its implementation */
  class NestedInteger {
      // Return true if this NestedInteger holds a single integer, rather than a nested list.
     var list: [NestedInteger]?
       var integer: Int?
       
       public init(_ list: [NestedInteger]) {
           self.list = list
       }
       
       public init(_ integer: Int) {
           self.integer = integer
       }
       
       public init() {
           self.list = [NestedInteger]()
       }
       
       public func isInteger() -> Bool {
           return self.integer != nil
       }
       
       public func getInteger() -> Int {
           return self.integer!
       }
       
       public func setInteger(value: Int) {
           self.integer = value
       }
       
       public func add(elem: NestedInteger) {
           if list != nil {
               self.list?.append(elem)
           } else {
               self.list = [NestedInteger]()
               self.list?.append(elem)
           }
       }
       
       public func getList() -> [NestedInteger] {
           return self.list!
       }
  }
 

class NestedIterator {
    
    var stack = [NestedInteger]()

    init(_ nestedList: [NestedInteger]) {
        for i in stride(from: nestedList.count - 1, through: 0, by: -1) {
            stack.append(nestedList[i])
        }
    }
    
    func next() -> Int {
        return stack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        while !stack.isEmpty {
            let current = stack.last!
            if current.isInteger(){
                return true
            }
            stack.removeLast()
            for i in stride(from: current.getList().count - 1, through: 0, by: -1) {
                stack.append(current.getList()[i])
            }
        }
        return false
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
