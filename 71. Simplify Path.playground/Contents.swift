import UIKit

var str = "Hello, playground"

/*Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.

In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level. For more information, see: Absolute path vs relative path in Linux/Unix

Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.

 

Example 1:

Input: "/home/"
Output: "/home"
Explanation: Note that there is no trailing slash after the last directory name.
Example 2:

Input: "/../"
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
Example 3:

Input: "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
Example 4:

Input: "/a/./b/../../c/"
Output: "/c"
Example 5:

Input: "/a/../../b/../c//.//"
Output: "/c"
Example 6:

Input: "/a//b////c/d//././/.."
Output: "/a/b/c"*/



class Solution {
    func simplifyPath(_ path: String) -> String {
        
        var stack:[String] = []
        let skip:Set<String> = [".","..",""]
        var result = ""
        
        guard path.count > 0 else {
            return "/"
        }
        
        for dir in path.split(separator: "/"){
            if (dir == ".." && !stack.isEmpty) {
                stack.removeLast()
            } else if (!skip.contains(String(dir))) {
                stack.append(String(dir))
            }
        }
        
        for dir in stack{
            result =  result + "/" + dir
        }
        
        
        return result.count > 0 ?  result : "/"
    }
}


var sol = Solution()
sol.simplifyPath("/home//foo/")
