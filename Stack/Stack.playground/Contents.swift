import UIKit

var str = "Hello, playground"

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)

print(stack)


let array = ["A","B","C","D"]
var strStack = Stack(array)
print(strStack)
strStack.pop()
print(strStack)

var newStack :Stack = [1,2,3,4,5]
print(newStack)


func reverseList(_ input:String) -> Bool {
    
    var stack = Stack<Character>()
    let charArray = Array(input)
    
    print(charArray)
    for c in charArray{
        if (c == "(")
        {
            stack.push(c);
        }
        
        if (c == ")")
        {
            let lastElement = stack.peek()
            if (lastElement == "(")
            {
                stack.pop()
            }
        }
    }
    
    print(stack)
    return stack.isEmpty()
}


print(reverseList("h((e))llo(world)()"))


/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 */


class Solution {
    func isValid(_ s: String) -> Bool {
        
        var stack:[Character] = []
        
        for char in s{
            if (char == "{" || char == "(" || char == "[" )
            {
                stack.append(char)
            }
            if (char == "}" || char == ")" || char == "]" )
            {
                if (char == "}")
                {
                    if stack.last == "{"
                    {
                        stack.removeLast();
                    }
                    else
                    {
                    return false
                    }
                }
                if (char == ")")
                {
                    if stack.last == "("
                    {
                        stack.removeLast();
                    }
                    else
                    {
                        return false
                    }
                }
                
                if (char == "]")
                {
                    if stack.last == "["
                    {
                        stack.removeLast();
                    }
                    else
                    {
                        return false
                    }
                }
                
            }
        }
        
        return stack.last == nil
    }
}

var obj = Solution()
obj.isValid("()")
obj.isValid("()[]{}")
obj.isValid("(]")
obj.isValid("([)]")
obj.isValid("]")

/*

 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.
 */


class Solution1 {
    func reverseString(_ s: inout [Character]) {
        var first = 0
        var last = s.count - 1
        
        var charArray = Array(s);
        print(charArray);

        while (first < last)
        {
            let temp = charArray[first]
            charArray[first] = charArray[last]
            charArray[last] = temp
//            (charArray[first],charArray[last]) = (charArray[last],charArray[first])
            first += 1
            last -= 1
        }
        s = charArray
    }
}

var testStr = Array("Hello")
var sol =  Solution1()
sol.reverseString(&testStr)


/*
 
 https://leetcode.com/problems/add-two-numbers/
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */



 // Definition for singly-linked list.
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
}

class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let preHead = ListNode(0)
        var p = l1, q = l2 , current = preHead
        
        var carry = 0
        while (p != nil || q != nil)
        {
            let val1 = p?.val ?? 0
            let val2 = q?.val ?? 0
            
            let sum = val1 + val2 + carry
            
            carry = sum/10
            current.next = ListNode(sum%10)
            current = current.next!
            
            p = p?.next
            q = q?.next
            }
            
            if (carry != 0)
            {
                current.next = ListNode(carry)
            }
            
            return preHead.next
    }
    

    
}
