import UIKit

var str = "Hello, playground"


/*There are a total of n courses you have to take, labeled from 0 to n-1.

Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.

There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.

Example 1:

Input: 2, [[1,0]]
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
             course 0. So the correct course order is [0,1] .
Example 2:

Input: 4, [[1,0],[2,0],[3,1],[3,2]]
Output: [0,1,2,3] or [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
             courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
             So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
Note:

The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
You may assume that there are no duplicate edges in the input prerequisites. */

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        //adj matrix
             var matrix:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: numCourses), count: numCourses)
             var indegree:[Int] = Array.init(repeating: 0, count: numCourses)
             var courseordered:[Int] = Array.init(repeating: 0, count: numCourses)
            var index = 0
                     
             for i in 0..<prerequisites.count{
                 let dependent = prerequisites[i][0]
                 let pre = prerequisites[i][1]
                 
                 // it has not been checked yet
                 if matrix[pre][dependent] == 0 {
                     indegree[dependent] += 1
                 }

                 matrix[pre][dependent] = 1
             }
                     
             var count = 0
             var queue:[Int] = []
             
             // add all with indegree 0
             for i in 0..<indegree.count{
                 if indegree[i] == 0 {
                     queue.append(i)
                    courseordered[index] = i;
                    index += 1
                }
             }
                     
             //start with all with indegree 0
             // remove edges and then when 0 add to queue
             while (!queue.isEmpty) {
                 let course = queue.removeFirst()
                 count += 1
                 // for all the courses, remove the course from indegree requirement as it is completed
                 for i in 0..<numCourses{
                     if matrix[course][i] != 0 {
                         indegree[i] -= 1
                         // if indegree is 0, then add to queue
                         if (indegree[i] == 0) {
                             queue.append(i)
                            courseordered[index] = i;
                            index += 1
                         }
                         
                     }
                 }
             }

        return count == numCourses ? courseordered : []
        
    }
}
