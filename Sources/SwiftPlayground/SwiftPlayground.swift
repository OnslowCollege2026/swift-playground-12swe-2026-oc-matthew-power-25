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
        print("Invalid Input. Must be an integer between \(min) and \(max)")
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
        print("Invalid Input. Must be a Double between \(min) and \(max)")
        return readDouble(from: min, to: max, prompt: prompt)
    }

    return doubleInput
}

/// Take a double and round it up to the next integer
/// Parameters:
/// - input: The double to be rounded
/// Returns the subsequent integer
func roundUp(_ input: Double) -> Int
{
    // Save the rounded integer, not necessarily above the double
    let RoundInput = Int(input)
    // If the closer integer is smaller than the original input, it means that it got rounded down
    if(Double(RoundInput) < input){
        return RoundInput + 1
    } else {
        return RoundInput
    }
}

/// Takes a double, and rounds it  to the nearest multiple of a number, eg an individual Kumara's weight.
/// Can also be used to smooth out the issues with double arithmetic, where small decimals are added.
/// Parameters:
/// - input: the number to be rounded
/// - interval: the interval to round  to
/// Returns the rounded number
func roundToInterval (_ input: Double, to interval: Double) -> Double
{
    let roundMultiplier = 1.0/interval
    let roundedDown = (Double(Int(input * roundMultiplier)) / roundMultiplier)
    let roundedUp = (Double(roundUp(input * roundMultiplier)) / roundMultiplier)
    // check if it is closer to the lower or upper round
    if(abs(roundedDown-input) < abs(roundedUp-input)){
        return roundedDown
    }
    else{
        return roundedUp
    }
}

/// Show the programs available to the user, and let them select one.
/// Returns an integer representing the user's selection.
func mainMenu() -> Int
{
    let lowestOption = 1
    let highestOption = 6

    print("""
    -----------------------------
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


        // Declaring important constants and variables to avoid magic numbers and keep track of data
        var currentStock = 0.0
        let maxStock = 50.0
        
        var totalWeightSold = 0.0
        var totalBagsSold = 0
        var totalEarnings = 0.0

        let pricePerKg = 3.0
        let pricePerBag = 0.2

        let singleKumaraWeight = 0.1

        let maximumWeightPerBag = 5.0

        // The smallest interval that prices can be tracked in. 0.01 tracks to cents
        let priceRoundingFactor = 0.01
        // Same for weight, with 0.001 tracking to grams
        let weightRoundingFactor = 0.001

        // 2D array containing previous sales. First row is the weight of kumara sold, second row is the number of bags used, and the third row is the sale price.
        var salesRecords : [[Double]] = [
            [],
            [],
            []
        ]

        // Main loop for the program
        while true
        {
            // Get the users's input, and execute an option accordingly.
            let userChoice = mainMenu()
            switch userChoice{
                // 1. Add Kumara Stock
                case 1: 

                // Check that the bin is not full
                if(currentStock >= maxStock) {
                    print("Bin is already full.")
                    continue
                }

                // Add to weight, ensuring that the new weight wont exceed the max weight
                let maxToAdd = roundToInterval(maxStock - currentStock, to: singleKumaraWeight)
                
                let weightToAdd = roundToInterval(readDouble(from: singleKumaraWeight, to: maxToAdd, prompt: "How much stock would you like to add (kg):"), to:  singleKumaraWeight)

                currentStock += weightToAdd
                currentStock = roundToInterval(currentStock, to: singleKumaraWeight)
                print("Kumara Added.")
                continue

                // 2. View Current Stock
                case 2:
                print("There is currently \(currentStock)kg of Kumara in stock.")
                continue

                // 3. View Previous Sales
                case 3:

                // Check that some sales have been made yet
                if(totalBagsSold == 0) {
                    print("No Sales have been made.")
                    continue
                }

                // Loop through sales, displaying how many kg of kumara and number of bags per sale
                for i in 0..<salesRecords[0].count {
                    print("\(i+1). Sold \(salesRecords[0][i])kg of Kumara using \(Int(salesRecords[1][i])) bags for $\(salesRecords[2][i])")
                }

                continue

                // 4. Show Summary Information
                case 4:

                // Check that some sales have been made yet
                if(totalBagsSold == 0) {
                    print("No Sales have been made.")
                    continue
                }

                print ("""
                Store Summary
                Total Weight Sold: \(roundToInterval(totalWeightSold, to: weightRoundingFactor))kg
                Total Bags Sold: \(totalBagsSold)
                Total Earnings: $\(roundToInterval(totalEarnings, to: priceRoundingFactor))
                Average Weight Per Bag: \(roundToInterval(totalWeightSold / Double(totalBagsSold), to: weightRoundingFactor))kg
                Average Earnings Per Bag: $\(roundToInterval(totalEarnings / Double(totalBagsSold), to: priceRoundingFactor))
                """)

                continue

                // 5. Record A Sale
                case 5:
                // Check that there is enough kumara in the box to begin with. If not, move on.
                if(currentStock < singleKumaraWeight){
                    print("There are no Kumara in the box.")
                    continue
                }

                // The user can purchase as many kumara as is in the box. However, they must have a limit of 5kg kumara per bag.
                let kumaraPurchased = roundToInterval(readDouble(from: singleKumaraWeight, to: currentStock, prompt: "How much Kumara would you like to purchase (kg):"), to: singleKumaraWeight)

                // Let the user choose how many bags to buy, with a maximum of 5kg per bag and a minimum of 0.1kg per bag
                let minimumBags = roundUp(kumaraPurchased/maximumWeightPerBag)
                let maximumBags = roundUp(kumaraPurchased/singleKumaraWeight)
                let bagsPurchased = readInteger(from: minimumBags, to: maximumBags, prompt: "How many bags would you like to use:")

                // Calculate the price
                let kumaraPrice = roundToInterval(kumaraPurchased * pricePerKg, to: priceRoundingFactor)
                let bagPrice = roundToInterval(Double(bagsPurchased) * pricePerBag, to: priceRoundingFactor)
                let salePrice = roundToInterval(kumaraPrice + bagPrice, to: priceRoundingFactor)
                print("""
                Cost of Kumara: $\(kumaraPrice)
                Cost of Bags: $\(bagPrice)
                Total Cost: $\(salePrice)
                """)

                // Adjust running totals accordingly
                currentStock -= kumaraPurchased
                totalWeightSold += kumaraPurchased
                totalBagsSold += bagsPurchased
                totalEarnings += salePrice

                // Re-round current stock to prevent issues with double maths
                currentStock = roundToInterval(currentStock, to: singleKumaraWeight)

                // Apply sales details to the array, with row 0 holding kumara weights, row 1 holding number of bags and row 2 holding sales.
                salesRecords[0].append(kumaraPurchased)
                salesRecords[1].append(Double(bagsPurchased))
                salesRecords[2].append(salePrice)

                continue

                // 6. Exit
                case 6:
                // This will only terminate the switch, so another break is used outside of the switch to exit the while loop.
                break

                // Fallback, start the loop again. should never be called due to the guard let function
                default:
                continue
            }

            // This code will only be run if the break within the switch is called. Breaking again will exit the program
            print("Thank you for using Kumara Stall.")
            break
        }
    }
}
