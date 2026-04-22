/// Prompt the user to enter an integer and return it
/// Parameters:
/// - from: the lower boundary, inclusive
/// - to: the upper boundary, inclusive
/// - prompt: the message printed to the user
/// Returns an integer between the two boundaries
func readInteger(from min: Int, to max: Int, prompt: String) -> Int
{
    print(prompt)

    // Take the user's input, and check if it is valid
    guard let rawInput = readLine() ,let intInput = Int(rawInput)
    , intInput >= min, intInput <= max 
    
    // If it isn't, run the function again
    else {
        print("Invalid Input. Must be an integer between \(min) and \(max).")
        return readInteger(from: min, to: max, prompt: prompt)
    }

    return intInput
}

/// Prompt the user to enter a double and return it
/// Parameters:
/// - from: the lower boundary, inclusive
/// - to: the upper boundary, inclusive
/// - prompt: the message printed to the user
/// Returns a double between the two boundaries
func readDouble(from min: Double, to max: Double, prompt: String) -> Double
{
    print(prompt)

    // Take the user's input, and check if it is valid
    guard let rawInput = readLine() ,let doubleInput = Double(rawInput)
    , doubleInput >= min, doubleInput <= max 
    
    // If it isn't, run the function again
    else {
        print("Invalid Input. Must be a Double between \(min) and \(max).")
        return readDouble(from: min, to: max, prompt: prompt)
    }

    return doubleInput
}

/// Show the programs available to the user, and let them select one.
/// Returns an integer representing the user's selection.
func mainMenu() -> Int
{
    let lowestOption = 1
    let highestOption = 6

    print("""
    Welcome to Kumara Stall.
    -----------------------------
    1. Add Kumara Stock
    2. View Current Stock
    3. View Previous Sales
    4. Show Summary Information
    5. Record a Sale
    6. Exit
    -----------------------------
    """)
    
    return readInteger(from: lowestOption, to: highestOption, prompt: "Please type an option and press enter:")
}

@main
struct SwiftPlayground {
    static func main() {

        let currentStock = 0.0
        let maxStock = 50.0
        
        let totalWeightSold = 0.0
        let totalBagsSold = 0

        let pricePerKg = 3.0
        let pricePerBag = 0.2

        let minimumPurchase = 0.1

        let maximumWeightPerBag = 5.0



        // Main loop for the program
        while true
        {
            // Get the users's input, and execute an option accordingly.
            let userChoice = mainMenu()
            switch userChoice{
                // 1. Add Kumara Stock
                case 1: 
                print("How much stock would you like to add:")
                continue

                // 2. View Current Stock
                case 2:
                continue

                // 3. View Previous Sales
                case 3:
                continue

                // 4. Show Summary Information
                case 4:
                continue

                // 5. Record A Sale
                case 5:
                continue

                // 6. Exit
                case 6:
                break

                // Fallback, start the loop again
                default:
                continue
            }
        }
    }
}
