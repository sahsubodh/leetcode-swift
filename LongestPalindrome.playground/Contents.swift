import UIKit

var str = "Hello, playground"

class Solution1 {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        
        var low = 0
        var maxL = 0
        var count = 1
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i,i,word,&low,&maxL)
            checkSubString(i,i+1,word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }
    
    func checkSubString(_ i:Int, _ j:Int, _ s:[Character],_ low:inout Int, _ maxL:inout Int) {
        var x = i
        var y = j
        while (x >= 0 && y < s.count && s[x] == s[y] ) {
            x -= 1
            y += 1
        }
        
        if (maxL < y - x - 1) {
            low = x + 1
            maxL = y - x - 1
        }
    }
}


func longestPalindrome(_ s: String) -> String {
    
    guard s == s && s.count > 0 else {
        return ""
    }
    
    if s.count == 1{
        return s
    }
    
    var start = 0;
    var end = 0;
    
    var inputArray = Array(s)

    
    for i in 0..<s.count {
        let len1 = expandAroungCenter(input: inputArray,left: i,right: i);
        let len2 = expandAroungCenter(input: inputArray,left: i,right: i+1);
        
        let len = max(len1, len2)
        
        if len > end - start{
            start = i - (len - 1) / 2;
            end = i + (len / 2);
        }
    }

    var result = ""
    for i in stride(from: start, to: end + 1, by: 1){
        result += String(inputArray[i])
    }
    
    return result
}



private func expandAroungCenter(input s:[Character],left left:Int, right right: Int) -> Int {
    var l = left;
    var r = right;
    
    while (l >= 0 && r < s.count && s[l] == s[r]){
        r += 1
        l -= 1
    }
    return r - l - 1;
}


//public String longestPalindrome(String s) {
//    if (s == null || s.length() < 1) return "";
//    int start = 0, end = 0;
//    for (int i = 0; i < s.length(); i++) {
//        int len1 = expandAroundCenter(s, i, i);
//        int len2 = expandAroundCenter(s, i, i + 1);
//        int len = Math.max(len1, len2);
//        if (len > end - start) {
//            start = i - (len - 1) / 2;
//            end = i + len / 2;
//        }
//    }
//    return s.substring(start, end + 1);
//}
//
//private int expandAroundCenter(String s, int left, int right) {
//    int L = left, R = right;
//    while (L >= 0 && R < s.length() && s.charAt(L) == s.charAt(R)) {
//        L--;
//        R++;
//    }
//    return R - L - 1;
//}


var input = "babad"

var result = longestPalindrome(input)
