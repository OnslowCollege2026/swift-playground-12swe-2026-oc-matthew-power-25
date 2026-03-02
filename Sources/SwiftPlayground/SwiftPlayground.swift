// The Swift Programming Language
// https://docs.swift.org/swift-book

func taskA()
{
    let temperatures = [
            [13,11,12,16],
            [14,13,9,15],
            [12,15,13,14]
        ]

        //Print the full first row
        print("Full first row.")
        for temp in temperatures[0] {
            print(temp)
        }
        //The value in row 2, column 3.
        print("The value in row 2, column 3 is:")
        print(temperatures[1][2])
        //The value in row 3, column 1.
        print("The value in row 3, column 1 is:")
        print(temperatures[2][0])
        //The average temperature of row 2.
        print("The average temperature of row 2 is:")
        var runningTotal = 0.0
        for temp in temperatures[1] {
            runningTotal += Double(temp)
        }
        let average = runningTotal / Double(temperatures[1].count)
        print(average)
}

func taskB() {
    let table = [
        [2, 4, 6],
        [8, 10, 12],
        [14, 16, 18]
    ]

    var runningTotal = 0
    for row in table{
        for value in row {
            print(value)
            runningTotal += 1
        }
    }

    print("Printed \(runningTotal) total values.")
}

func taskC() {
    let table = [
        [3, 5, 7, 9],
        [2, 4],
        [8, 6, 1],
        [10]
    ]
    for i in 0...3 {
        print("Column \(i) total is \(columnTotal(in: table, column: i))")
    }
}

func taskD() {
    let readings = [
        [1.5, 3.2, 2.8],
        [7.1],
        [4.4, 6.0],
        [5.9, 8.3, 0.7, 2.2]
    ]

    if maxValue(in: readings) != nil{
        let maxValue = maxValue(in: readings)!
        print("The max value is \(maxValue)")
    } else {
        print("Table is nil")
    }
}

func columnTotal(in table: [[Int]], column: Int) -> Int
{
    var total = 0
    for row in table{
        if(row.count > column){
            total += row[column]
        }
    }
    return total
}

func maxValue(in table: [[Double]]) -> Double? {
    //Check if array is empty
    if(table.count <= 0 && table[0].count <= 0){
        return nil
    }
    //Otherwise find max
    var max = 0.0
    for row in table{
        for value in row {
            if(value) > max{
                max = value
            }
        }
    }
    return max
}

@main
struct SwiftPlayground {
    static func main() {

        taskA()
        taskB()
        taskC()
        taskD()

    }
}
