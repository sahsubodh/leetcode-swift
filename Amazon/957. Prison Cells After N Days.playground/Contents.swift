import UIKit

var str = "Hello, playground"

/*There are 8 prison cells in a row, and each cell is either occupied or vacant.

Each day, whether the cell is occupied or vacant changes according to the following rules:

If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
Otherwise, it becomes vacant.
(Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)

 

Example 1:

Input: cells = [0,1,0,1,1,0,0,1], N = 7
Output: [0,0,1,1,0,0,0,0]
Explanation:
The following table summarizes the state of the prison on each day:
Day 0: [0, 1, 0, 1, 1, 0, 0, 1]
Day 1: [0, 1, 1, 0, 0, 0, 0, 0]
Day 2: [0, 0, 0, 0, 1, 1, 1, 0]
Day 3: [0, 1, 1, 0, 0, 1, 0, 0]
Day 4: [0, 0, 0, 0, 0, 1, 0, 0]
Day 5: [0, 1, 1, 1, 0, 1, 0, 0]
Day 6: [0, 0, 1, 0, 1, 1, 0, 0]
Day 7: [0, 0, 1, 1, 0, 0, 0, 0]

Example 2:

Input: cells = [1,0,0,1,0,0,1,0], N = 1000000000
Output: [0,0,1,1,1,1,1,0]
 

Note:

cells.length == 8
cells[i] is in {0, 1}
1 <= N <= 10^9
 */

//https://leetcode.com/problems/prison-cells-after-n-days/discuss/205721/Swift-solution%3A-16ms

//For any size prison and starting occupancy, it will settle down to a repeating pattern. Once that has happened, the pattern will always re-appear on the same periodicity as the rules for the room changes are fixed.
//
//On the first day the first and last cells may be occupied, but after that they will always be empty. So get one day out of the way, then count the number of days until the Day 2 configuration re-appears. That calculates the periodicity, and from that the final state can be determined by cycling through only the remainder of the number of days, when the total is divided by the period.
//
//I'd be interested to know if there is a reasonable mathematical way to calculate the periodicity, rather than determining it simply by observing the initial state and counting until it reappears.

class Solution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        
        var currentDay = processDay(cells)
        let originalCells = currentDay
        
        var count = 0
        
        repeat {
            currentDay = processDay(currentDay)
            count += 1
        } while currentDay != originalCells
        
        let cyclesToComplete = (N-1)%count
        
        if cyclesToComplete == 0 {
            return currentDay
        } else {
            
            for _ in 1...cyclesToComplete {
                currentDay = processDay(currentDay)
            }
        }
        
        return currentDay
    }
    
    func processDay(_ cells: [Int]) -> [Int] {
        var newCells = [Int]()
        newCells.append(0)
        for index in 1..<cells.count-1 {
            newCells.append(cells[index-1] == cells[index+1] ? 1 : 0)
        }
        newCells.append(0)
        return newCells
    }
}
