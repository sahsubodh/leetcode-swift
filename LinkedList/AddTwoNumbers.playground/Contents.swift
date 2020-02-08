import UIKit

var str = "Hello, playground"


/*You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var node = ListNode(-1);
    
    return node;
}





func iter(_ l1: ListNode?)
{
    var root = l1;
    
    var iter = l1;
    
    while (iter?.next != nil)
    {
        if let value = iter?.val
        {
            print(value);
        }
//        print(iter?.val);
        iter = iter?.next;
    }
    if let value = iter?.val
    {
        print(value);
    }
}

func iter_count(_ l1: ListNode?) -> Int
{
    var count = 0;
    
    var iter = l1;
    
    while (iter?.next != nil)
    {
        count += 1;
        iter = iter?.next;
    }
    count += 1;
    print("count is \(count)")
    return count;
}

func insert(temp:ListNode,_ l1: ListNode?)
{
    var iter = l1;
    
    while (iter?.next != nil)
    {
        iter = iter?.next;
    }
    
    iter?.next = temp;
}

var test1 = ListNode(1);
var test2 = ListNode(2);
var test3 = ListNode(3);

insert(temp: test1, nil);
insert(temp: test2, test1);
insert(temp: test3, test1);


var test4 = ListNode(4);
var test5 = ListNode(5);
var test6 = ListNode(6);

var test7 = ListNode(7);

insert(temp: test4, nil);
insert(temp: test5, test4);
insert(temp: test6, test4);


//iter(test1);
//print();
//iter(test4);

var iter1 = test1;
var iter2 = test4;

var iter3 = test1;
var iter4 = test4;

var count2 = iter_count(test1);
var count1 = iter_count(test7);

var result:ListNode?

if (count1 <= count2)
{
    print("in here")
    
    while (iter1.next != nil)
    {
        iter1 = iter1.next ?? 0;
    }
}




