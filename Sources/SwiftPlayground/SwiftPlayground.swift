// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Get a valid number above zero from a prompt and return it
/// Parameters:
/// - prompt: the string asking the user what to enter
/// - min: the inclusive lowest number acceptable
/// - max: the highest value acceptable
/// Returns an integer meeting conditions
func readNumber(prompt:String, from min:Int, to max: Int) -> Int {
    print(prompt)
    guard let userInput = readLine(), let number = Int(userInput), number >= min, number <= max else {
        print("Invalid Number")
        return readNumber(prompt: prompt, from: min, to: max)
    }
    return number
}

/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]])
{
    for row in board{
        print(row.joined(separator: " "))
    }
}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]]
{
    /// Find the tile that the user guessed
    let hitGuess = guesses[row][col]
    if hitGuess == "~" {
        // Check if is a hit or a miss
        let hitTile = ocean[row][col]
        if(hitTile == "S"){
            print("Hit a Ship!")
            var newGuesses = guesses
            newGuesses[row][col] = "X"
            return newGuesses
        } else {
            print("Miss")
            var newGuesses = guesses
            newGuesses[row][col] = "O"
            return newGuesses
        }
    } else {
        print("Tile has already been guessed. No changes made.")
        return guesses
    }
}

/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
/// 
/// Returns: How many ships remain unhit.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int
{
    // Loop through the board, counting all ships placed
    var initialShips = 0
    for row in ocean{
        for cell in row{
            if cell == "S"{
                initialShips += 1
            }
        }
    } 

    // Loop through the board, counting down for every hit
    var remainingShips = initialShips
    for row in guesses{
        for cell in row{
            if cell == "X"{
                remainingShips -= 1
            }
        }
    }

    // return the result
    return remainingShips
}

/// Parameters:
/// - size: The width and height of the square grid.
/// - shipCount: How many ships to place.
///
/// Returns: A new ocean grid with ships placed.
func randomShipPlacement(size: Int, shipCount: Int) -> [[String]]
{
    // Create an empty board to add ships to.
    var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
    ///Counter of ships placed
    var placed = 0
    while placed < shipCount {
        let row = Int.random(in: 0..<size)
        let col = Int.random(in: 0..<size)
        if ocean[row][col] == "~" {
            ocean[row][col] = "S"
            placed += 1
        }
    }
    return ocean
}

@main
struct SwiftPlayground {
    static func main() {

        /// The length of the grid in both dimensions
        let size = 6
        /// Places on the board, either ships (S) or sea (~)
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        /// Where the player has guessed, either hit (X) or miss (O), otherwise empty sea (~)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)
        /// Number of turns for user
        let turns = 15

        // Randomize board
        ocean = randomShipPlacement(size: 6, shipCount: 4)
        // // Check output
        // print(ocean)


        // Main loop
        for _ in 0..<turns {
            // Show the board to the user
            print("Guesses: ")
            printBoard(guesses)

            // Get the users tile chosen
            let row = readNumber(prompt: "Enter Row, from 0 to 5.", from: 0, to: size-1)
            let column = readNumber(prompt: "Enter Column, from 0 to 5", from: 0, to: size-1)

            // Alter the guesses array
            guesses = processGuess(row: row, col: column, ocean: ocean, guesses: guesses)

            // Check if any ships are left
            if remainingShips(in: ocean, guesses: guesses) == 0 {
                print("Victory!")
                break
            }
        }

        // If ships remain, print a game over message
        if(remainingShips(in: ocean, guesses: guesses)) > 0 {
            print("Game Over.")
        }

        // Show the board at the end.
        print("Final Board: ")
        printBoard(ocean)
    }
}
