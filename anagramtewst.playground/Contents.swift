import UIKit

var str = "Hello, playground"



var s1 = "test"
var s2 = "etst"


func isAnagram (_ s1:String, _ s2:String) -> Bool
{
    
    guard s1.count == s2.count else {
        return false
    }

    var unicode_a = Int(UnicodeScalar("a").value)
    var counter = Array.init(repeating:0, count:128)

    for i in s1.unicodeScalars{
        counter[Int(i.value) - unicode_a] += 1
    }

    for i in s2.unicodeScalars{
        counter[Int(i.value) - unicode_a] -= 1
    }

    for i in counter{
        if (i != 0)
        {
            return false
        }
    }

    return true

}


var result = isAnagram("Test", "east")
