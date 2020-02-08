import UIKit

var str = "Hello, playground"

//https://leetcode.com/discuss/interview-question/396418/

//GCD calculation is O(log (min(x, y)) others are constants



func lattice(_ ax:Int,_ ay:Int,_ bx:Int,_ by:Int) -> [Int] {
    
    let dx = bx - ax , dy = by - ay
    
    //rotate 90
    var rx = dy , ry = -dx
    
    // since question asks for minimum
    let gcdValue = abs(gcd(rx, ry))
    
    rx =  rx / gcdValue
    ry =  ry / gcdValue
    
    return [rx+bx,ry+by]
    
}

func gcd(_ x:Int,_ y:Int) -> Int {
    return y == 0 ? x : gcd(y,x%y)
}


print(lattice(-1, 3, 3, 1))
