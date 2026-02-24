// The Swift Programming Language
// https://docs.swift.org/swift-book

func print(board: [[String]])
{
    for (i, line) in board.enumerated(){
        print("\(line[0]) | \(line[1]) | \(line[2])")
        if(i != 2) {
            print("--+---+--")
        }
    }

    print()
}

func askForPosition(board: [[String]]) -> [Int]
{
    while true {
        var rowNum = -1
        var colNum = -1
        print("Please enter the row number, 1-3: ")
        if let userInput = readLine(), let rowNumber = Int(userInput), rowNumber - 1 >= 0, rowNumber - 1 <= 2{
            rowNum = rowNumber - 1
        } else {
            continue
        }

        print("Please enter the column number, 1-3: ")
        if let userInput2 = readLine(), let columnNumber = Int(userInput2), columnNumber - 1 >= 0, columnNumber - 1 <= 2{
            colNum = columnNumber - 1
        } else {
            continue
        }

        if(board[rowNum][colNum] == "."){
            return [rowNum, colNum]
        } 
    }
}

func checkBoardFull(board : [[String]]) -> Bool
{
    for row in 0...2
    {
        for col in 0...2
        {
            if(board[row][col] == ".")
            {
                return false
            } else {
                continue
            }
        }
    }
    return true
}

@main
struct SwiftPlayground {
    static func main() {
        var player = "X"

        var board = [
            [".", ".", "."], // row 0
            [".", ".", "."], // row 1
            [".", ".", "."], // row 2
        ]

        print(board: board)

        while !checkBoardFull(board: board){
            let position = askForPosition(board: board)
            board[position[0]][position[1]] = player

            if(player == "O"){
                player = "X"
            } else {
                player = "O"
            }

            print(board: board)
        }
    }
}
