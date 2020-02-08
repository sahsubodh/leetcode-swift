import UIKit

var str = "Hello, playground"


//class MovingAverage {
//
//    var array:[Int];
//    var size:Int;
//    var count = 0
//
//    /** Initialize your data structure here. */
//    init(_ size: Int) {
//        array = []
//        self.size = size
//    }
//
//    func next(_ val: Int) -> Double {
//        if (array.count < size)
//        {
//            array.append(val)
//            count += 1
//        } else {
//            count = size
//            array.removeFirst()
//            array.append(val)
//        }
//
//        let sum = array.reduce(0, +)
//        var result:Double;
//        if (count > 1){
//            result = Double(sum)/Double(count)
//        } else{
//          result = Double(sum)
//        }
//
//        return result
//    }
//}
//
//
//class MovingAverage1 {
//
//    var array:[Int];
//    var size:Int;
//    var count = 0
//    var sum = 0;
//    var index = -1
//
//    /** Initialize your data structure here. */
//    init(_ size: Int) {
//        array = .init(repeatElement(0, count: size))
//        self.size = size
//    }
//
//    func next(_ val: Int) -> Double {
//        if count < size{
//            count += 1
//        }
//        index = (index + 1) % size
//
//        sum -= array[index];
//        sum += val;
//        array[index] = val
//                return Double(sum)/Double(count)
//    }
//}
//
//let obj = MovingAverage1(3)
//let ret_1: Double = obj.next(1)
//let ret_2: Double = obj.next(10)
//let ret_3: Double = obj.next(3)
//let ret_4: Double = obj.next(5)



class MinStack {
    
    var stack:[Int] = []

    var min = Int.max
    
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if stack.isEmpty {
            stack.append(0)
            min = x
        }else {
            stack.append(x-min)
            if (min > x)
            {
                min = x
            }
        }
   
    }
    
    
    func pop() {
        if stack.isEmpty{
            return
        }
        
        var pop = stack.removeLast()
        if (pop < 0){
            min = min - pop
        }
        
    }
    

    func top() -> Int {
        guard let top = stack.last else {
            return -1
        }
        if (top > 0){
            return top + min
        } else {
            return min
        }
        
    }
    
    func getMin() -> Int {
        return min
    }
}

/**
 * Your MinStack object will be instantiated and called as such: */
//  let obj = MinStack()
//
////    obj.push(3)
////    obj.pop()
//
//  obj.push(-2);
//  obj.push(0);
//  obj.push(-3);
//  obj.getMin();   //--> Returns -3.
//  obj.pop();
//  obj.top();      //--> Returns 0.
//  obj.getMin(); //  --> Returns -2.
 


class MaxStack {

    /** initialize your data structure here. */
    
    var stack:[Int] = []
    var maxstack:[Int] = []
    
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        let max = peekMax()
        if (max < x){
            maxstack.append(x)
        }else {
            maxstack.append(max)
        }
   
    }
    
    func pop() -> Int {
        if !stack.isEmpty{
            maxstack.removeLast()
            return stack.removeLast()
         }
        
         return -1
    }
    
    func top() -> Int {
        if !stack.isEmpty{
            return stack.last!
        }
        return -1
    }
    
    func peekMax() -> Int {
        if !maxstack.isEmpty{
            return maxstack.last!
        }
        return -1
    }
    
    func popMax() -> Int {
        var max = peekMax()
        var newStack:[Int] = [];
        while (top() != max){
            newStack.append(pop())
        }
        pop()
        while (!newStack.isEmpty){
            push(newStack.removeLast())
        }
        
        return max
    }
}


/**
* Your MaxStack object will be instantiated and called as such: */
 let obj = MaxStack()
 obj.push(5)
obj.push(1)
obj.push(5)
obj.top()
obj.popMax()
obj.top()
obj.peekMax()
obj.pop()
obj.top()
// let ret_2: Int = obj.pop()
// let ret_3: Int = obj.top()
// let ret_4: Int = obj.peekMax()
// let ret_5: Int = obj.popMax()

class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        
        if T.isEmpty {
                return[]
        }
            
        if T.count == 1 {
            return [0]
        }
        
        var answer:[Int] = Array.init(repeating: 0, count: T.count);
        var stack:[Int] = [];
        
        for i in stride(from: T.count - 1, through: 0, by:  -1){
            //remove all smaller elements from stack
            while (!stack.isEmpty && T[i] >= T[stack.last!]){
                stack.popLast();
            }

            answer[i] = stack.isEmpty ? 0 : stack.last! - i
            
            stack.append(i)
        }
        
        return answer
    }
}

var input =  [73, 74, 75, 71, 69, 72, 76, 73]
var sol = Solution();
print(sol.dailyTemperatures(input))
//[1, 1, 4, 2, 1, 1, 0, 0].



func wallsAndGates(_ rooms: inout [[Int]]) {
    guard rooms.count > 0 else {
        return
    }
    
    let m = rooms.count
    let n = rooms[0].count
    
    var visited:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: n), count: m)
    
    for i in 0..<m{
        for j in 0..<n{
            if rooms[i][j] == 0{
                wallsAndGatesHelper(row: i, col: j, distance: 0, visited: &visited, &rooms)
            }
        }
    }

}

func wallsAndGatesHelper(row i:Int, col j:Int,distance d:Int,visited visit:inout [[Bool]],_ rooms:inout [[Int]]){
    let m = rooms.count
    let n = rooms[0].count
    
    //check range
    if (i < 0 || i >= m || j < 0 || j >= n){
        return
    }
    
    //if already visited
    if visit[i][j]{
        return
    }
    
    //if a barrier
    if (rooms[i][j] == -1){
        return
    }
    
    //distance is longer
    if (d > rooms[i][j]){
        return
    }
    
    visit[i][j] = true
    
    if (d < rooms[i][j]){
        rooms[i][j] = d
    }
    
    wallsAndGatesHelper(row: i+1, col: j, distance: d+1, visited: &visit, &rooms)
    wallsAndGatesHelper(row: i-1, col: j, distance: d+1, visited: &visit, &rooms)
    wallsAndGatesHelper(row: i, col: j+1, distance: d+1, visited: &visit, &rooms)
    wallsAndGatesHelper(row: i, col: j-1, distance: d+1, visited: &visit, &rooms)

    visit[i][j] = false
    
}
    

func wallsAndGates1(_ rooms: inout [[Int]]) {
    guard rooms.count > 0 else {
        return
    }
    
    let m = rooms.count
    let n = rooms[0].count
    
    var queue:[Int] = []
    
    for i in 0..<m{
        for j in 0..<n{
            if rooms[i][j] == 0{
                queue.append(i*n+j)
            }
        }
    }

    while(!queue.isEmpty){
        let head = queue.removeFirst()
        let x = head/n;
        let y = head%n;
        
        if (x>0 && rooms[x-1][y] == 2147483647){
            rooms[x-1][y] = rooms[x][y] + 1
            queue.append((x-1) * n + y)
        }
        
        if (x<m-1 && rooms[x+1][y] == 2147483647){
            rooms[x+1][y] = rooms[x][y] + 1
            queue.append((x+1) * n + y)
        }
        
        if (y>0 && rooms[x][y-1] == 2147483647){
            rooms[x][y-1] = rooms[x][y] + 1
            queue.append(x * n + (y-1))
        }
        
        if (y<n-1 && rooms[x][y+1] == 2147483647){
            rooms[x][y+1] = rooms[x][y] + 1
            queue.append(x * n + (y+1))
        }
    }
    
}


var test = Int.max


func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    
    var count = 0
    
    let m = grid.count
    let n = grid[0].count
    
    var input = grid
    
    for i in 0..<m{
        for j in 0..<n{
            if input[i][j] == "1"{
                count += 1
                mergeIsland(row: i, col: j, &input)
            }
        }
    }
    
    
    return count
}

func mergeIsland(row i:Int, col j:Int, _ grid: inout[[Character]]){
    let m = grid.count
    let n = grid[0].count
    
    //check range
    if (i < 0 || i >= m || j < 0 || j >= n){
        return
    }
    
    guard grid[i][j] == "1" else {
        return
    }
    grid[i][j] = "X"
    
    mergeIsland(row: i+1, col: j, &grid)
    mergeIsland(row: i-1, col: j, &grid)
    mergeIsland(row: i, col: j+1, &grid)
    mergeIsland(row: i, col: j-1, &grid)
    
}


func numIslands1(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    
    var count = 0
    
    let m = grid.count
    let n = grid[0].count
    
    var input = grid
    

    for i in 0..<m{
        for j in 0..<n{
            if input[i][j] == "1"{
                count += 1
                
                var queue:[Int] = []
                queue.append(i*n+j)

                while (!queue.isEmpty){
                    let head = queue.removeFirst()
                    let x = head/n
                    let y = head%n
                    
                    if (x>0 && input[x-1][y] == "1"){
                        input[x-1][y] = "X"
                        queue.append((x-1) * n + y)
                    }
                    
                    if (x<m-1 && input[x+1][y] == "1"){
                        input[x+1][y] = "X"
                        queue.append((x+1) * n + y)
                    }
                    
                    if (y>0 && input[x][y-1] == "1"){
                        input[x][y-1]  = "X"
                        queue.append(x * n + (y-1))
                    }
                    
                    if (y<n-1 && input[x][y+1] == "1"){
                        input[x][y+1]  = "X"
                        queue.append(x * n + (y+1))
                    }
                    
                }
            }
        }
    }
    
    return count
}


func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    guard amount > 0 else {
        return 0
    }
    
    var dp:[Int] = Array.init(repeating:0, count: amount + 1)
    
    return coinChange(input: coins, left: amount, output: &dp)
}


func coinChange(input coins:[Int],left remainder:Int,output dp: inout [Int]) -> Int
{
    if remainder == 0 {
        return 0
    }
    
    guard remainder > 0 else {
        return -1
    }
    
    if (dp[remainder] != 0){
        return dp[remainder]
    }
    
    var min = Int.max
    for coin in coins{
        var changeresult = coinChange(input: coins, left: remainder - coin, output: &dp)
        
        if (changeresult >= 0 && changeresult < min){
            min = changeresult + 1
        }
    }
    
    dp[remainder] = (min == Int.max) ? -1 : min
    
    return dp[remainder]
    
}


func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
    
    let max = amount + 1
    
    var dp = Array.init(repeating: max, count: max)
    
    dp[0] = 0
    
    for i in stride(from: 1, through: amount, by: 1){
        for c in coins{
            if c <= i{
                dp[i] = min(dp[i], dp[i-c]+1)
            }
        }
    }

    return dp[amount] > amount ? -1 : dp[amount]
}


func change(_ amount: Int, _ coins: [Int]) -> Int {
    
    guard amount > 0 else {
        return 1
    }
    
    guard coins.count > 0 else{
        return 0
    }
    
    var dp:[Int] = Array.init(repeating: 0, count: amount+1)
    
    dp[0] = 1
    
    for c in coins{
        for i in stride(from: c, through: amount, by: 1){
            dp[i] += dp[i-c];
        }
    }
    
    
    return dp[amount]
}

var result = change(5, [1,2,5])


func longestPalindrome(_ s: String) -> Int {
    
//    var count = 0
//    var dict:[Character:Int] = [:]
//
//    for c in s{
//        if let value = dict[c] {
//            dict[c] = value + 1
//        } else {
//            dict[c] = 1
//        }
//    }
//
//    var hasOdd = false;
//
//    for (char,value) in dict{
//        if value.isMultiple(of: 2) {
//            count += value
//        } else {
//            hasOdd = true
//            count += value - 1
//        }
//    }
//
//    if (hasOdd) {
//        count += 1
//    }
//
//    return count
    
    var count = Array(repeating:0, count: 128)
        for ch in s {
            count[Int(ch.asciiValue!)] += 1
        }
        var ans = 0
        for c in count {
            ans += c/2 * 2
            if( ans % 2 == 0 && c % 2 == 1) {
                ans += 1
            }
        }
        return ans
}



let inputString = "abccccdd"
var result1 = longestPalindrome(inputString)



