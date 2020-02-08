import UIKit

var str = "Hello, playground"

/*
 You are given with a string . Your task is to remove atmost two substrings of any length from the given string such that the remaining string contains vowels('a','e','i','o','u') only. Your aim is the maximise the length of the remaining string. Output the length of remaining string after removal of atmost two substrings.
 NOTE: The answer may be 0, i.e. removing the entire string.

 Sample Input
 2
 earthproblem
 letsgosomewhere
 Sample Output
 3
 2
 */

//3 cases:
//1- Vowel at the start or the end (vcvc or cvcv)
//2- Vowel at the start and the end (vcvcv)
//3- No Vowel at the start and the end (cvc)
//
//reduce case 1 and 2 to case 3 and get the longest vowel substring
//the result is vowels at the start + vowels at the end + longest vowel substring size
// o(n) solution


//https://leetcode.com/discuss/interview-question/233724


var vowels:Set<Character> = ["a", "e", "i", "o", "u"]

func solution(_ s:String) -> Int {
    
    let charArray = Array(s)
    
    var start = 0, end = charArray.count - 1 , result = 0
    
    while (start<end) {
        if vowels.contains(charArray[start]) {
            start += 1
            result += 1
        } else if vowels.contains(charArray[end]) {
            end -= 1
            result += 1
        } else {
            break
        }
    }
    
    result += longestVowelInternal(charArray, start, end)
    
    return result
}

private func longestVowelInternal(_ charArray:[Character],_ start:Int,_ end:Int) -> Int {
    var maximum = 0
    var lengthSoFar = 0
    
    for i in stride(from: start+1, to: end, by: 1){
        
        if (vowels.contains(charArray[i])) {
            if lengthSoFar == 0 {
                lengthSoFar = 1
            }
            if vowels.contains(charArray[i-1]) {
                lengthSoFar += 1
            }
            
            maximum = max(lengthSoFar,maximum)
        } else {
            lengthSoFar = 0
        }
    }
    
    return maximum
}



print(solution("earthproblem"))
print(solution("letsgosomewhere"))
print(solution("aaayyyaayyayaaayayaaa"))
