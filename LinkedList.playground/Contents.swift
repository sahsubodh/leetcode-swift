import UIKit

var str = "Hello, playground"

print("Example of creating nodes")
let node1 = Node(value: 1, next: nil)
let node2 = Node(value: 2, next: node1)
let node3 = Node(value: 3, next: node2)
    
print(node1)

print("Example of  LinkedList push")

var linkedlist = LinkedList<Int>()

linkedlist.push(3)
linkedlist.push(2)
linkedlist.push(1)


print(linkedlist);

print("Example of LinkedList append")

linkedlist.append(3)
linkedlist.append(2)
linkedlist.append(1)


print(linkedlist);


print("Example of LinkedList insert at index")

var llist = LinkedList<Int>()

llist.append(1)
llist.append(2)
llist.append(3)

var node = llist.node(at: 1);
print(node!.value)

print("before insert : \(llist)")
llist.insert(value: 4, after: node!)
print("after insert : \(llist)")


print("before pop : \(llist)")
var poppednode = llist.pop();
print("popped \(String(describing: poppednode))")
print("after pop : \(llist)")

var removedNode = llist.removeLast()
print("removedNode \(String(describing: removedNode))")
print("after removeLast : \(llist)")

var head_node = llist.node(at: 0)
llist.remove(after: head_node!);
print("after remove : \(llist)")


print("using collection")
var list = LinkedList<Int>()
for i in 0...9{
    list.append(i);
}

print("List \(list)")
print("First element \(list[list.startIndex])")
print("Array containing first 3 elements \(Array(list.prefix(3)))")
print("Array containing last 3 elements \(Array(list.suffix(3)))")
let sum = list.reduce(0,+)
print(sum);


print("reverse linkedlist")
var revLinklist = LinkedList<Int>();
for i in 1...3{
    revLinklist.append(i)
}
print("List \(revLinklist)")

revLinklist.reverseList(next: revLinklist.head!)



