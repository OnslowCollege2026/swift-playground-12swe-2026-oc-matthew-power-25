// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Get a valid integer from a range and return it
/// Parameters:
/// - from: the lower inclusive bound
/// - to: the upper inclusive bound
/// - prompt: the message printed to the user
/// Returns: an integer entered by the user
func readNumber(from min:Int, to max:Int, prompt:String) -> Int {
    print(prompt)
    guard let userInput = readLine(), let number = Int(userInput), number >= min, number <= max else {
        print("Invalid Number")
        return readNumber(from: min, to: max, prompt: prompt)
    }
    return number
}

/// Gets a number from 1 to 5, depending on a users choice from the menu
/// Returns: integer 1 to 5 representing a menu option
func menuChoice() -> Int
{
    print("""
    ==== Egg Shop ====
    1. Add Eggs
    2. Sell Eggs
    3. Show current stock
    4. Show eggs sold
    5. Shop Summary
    6. Exit
    """)

    return readNumber(from: 1, to: 6, prompt: "Choose an option:")
}

/// Add eggs to count. does not change values if new stock is above 1000
/// Parameters:
/// - currentStock: the current number of eggs
/// - amount: the number of eggs to increase by
/// Returns: The stock of eggs after increasing the count
func addEggs(currentStock: Int, amount: Int) -> Int
{
    let newStock = currentStock + amount
    if(newStock > 1000){
        print("Stock cannot exceed 1000. Values not changed.")
        return currentStock
    }
    return currentStock + amount
}

/// Removes eggs from count
/// Parameters:
/// - currentStock: the current number of eggs
/// - amount: the number of eggs to decrease by
/// Returns: The stock of eggs after decreasing the count
func sellEggs(currentStock: Int, amount: Int) -> Int
{
    return currentStock - amount
}

/// Updates sold count
/// Parameters:
/// - currentStock: the current number of eggs sold
/// - amount: the number of eggs to increase by
/// Returns: The updated number of sold eggs
func updateSoldCount(currentSold: Int, amount: Int) -> Int
{
    return currentSold + amount
}

/// Creates a message showing number of eggs in stock
/// Parameters:
/// - stock: The amount of eggs in stock
/// Returns a string containing the message
func stockMessage(stock: Int) -> String
{
    let newStockMessage = "Current stock of eggs is \(stock) eggs."
    return newStockMessage
}

/// Creates a message showing number of eggs sold
/// Parameters:
/// - sold: The amount of eggs sold
/// Returns a string containing the message
func soldMessage(sold: Int) -> String
{
    let newSoldMessage = "Number of eggs sold is \(sold) eggs."
    return newSoldMessage
}

/// Creates a message summarising the store's status
/// Parameters:
/// - stock: The current number of eggs in stock
/// - sold: The total number of eggs sold
/// Returns a summary message as a string
func summaryMessage(stock: Int, sold: Int) -> String
{
    let newSummaryMessage = """
    ==== Summary ====
    The shop currently has \(stock) eggs in stock.
    A total of \(sold) eggs have been sold.
    """
    return newSummaryMessage
}

@main
struct SwiftPlayground {
    static func main() {
        
        // The number of eggs in stock and number sold
        var eggsInStock = 0
        var eggsSold = 0

        while true{
            let menuChosen = menuChoice()
            // Add Eggs
            if(menuChosen == 1){
                let eggsToAdd = readNumber(from: 1, to: 1000, prompt: "How many eggs to add:")
                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsToAdd)
            } 
            // Sell Eggs
            else if(menuChosen == 2){
                if(eggsInStock <= 0){
                    print("No eggs to sell.")
                    continue
                }
                let eggsToSell = readNumber(from: 1, to: eggsInStock, prompt: "How many eggs to sell:")
                eggsInStock = sellEggs(currentStock: eggsInStock, amount: eggsToSell)
                eggsSold = updateSoldCount(currentSold: eggsSold, amount: eggsToSell)
            }
            // Show current stock 
            else if(menuChosen == 3)
            {
                print(stockMessage(stock: eggsInStock))
            }
            // Show eggs sold
            else if(menuChosen == 4)
            {
                print(soldMessage(sold: eggsSold))
            }
            // Summary
            else if(menuChosen == 5)
            {
                print(summaryMessage(stock: eggsInStock, sold: eggsSold))
            }
            // Exit
            else if(menuChosen == 6)
            {
                print("Exiting program.")
                break
            }
        }
    }
}
