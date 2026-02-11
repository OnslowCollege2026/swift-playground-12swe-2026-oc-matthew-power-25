// The Swift Programming Language
// https://docs.swift.org/swift-book

// An intro to the program
func printRoomIntro() {
    print("This program calculates room area and volume.")
    print("It also finds the usable space after furniture.")
}

// Print a divider when called
func printDivider() {
    print("--------")
}

//tells user about units
func printUnitsNote() {
    print("All measurements are in metres.")
}

//Goodbye message for the user
func printGoodbye() {
    print("Done. Thanks for using the calculator.")
}

//Get a valid number above zero from a prompt and return it
func readNumber(prompt:String) -> Double {
    print(prompt)
    guard let userInput = readLine(), let number = Double(userInput), number > 0 else {
        print("Invalid Number")
        return readNumber(prompt: prompt)
    }
    return number
}

@main
struct SwiftPlayground {
    static func main() {

        ///the threshold of an overisize piece of furniture
        let maximumItemVolume = 2.0
        ///the threshold of usable volume being too small
        let minimumUsableVolume = 60.0

        //Declare furniture sizes in an array
        let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]

        //Introduce the program
        printRoomIntro()
        printUnitsNote()

        //Get Dimensions
        let roomLength = readNumber(prompt: "Enter Room Length:")
        let roomWidth = readNumber(prompt: "Enter Room Width")
        let roomHeight = readNumber(prompt: "Enter Room Height")

        printDivider()

        //Calculate and print the area of the room
        let roomArea = roomLength * roomWidth
        print("Room area: \(roomArea)m²")

        //Do the same again for volume
        let roomVolume = roomArea * roomHeight
        print("Room volume: \(roomVolume)m³")

        printDivider()

        //Loop through furniture
        ///The total volume of furniture
        var totalFurnitureVolume = 0.0 
        for (index, volume) in furnitureVolumes.enumerated(){
            if (volume > maximumItemVolume){
                print("Oversized Furniture Detected")
            }
            print("Item \(index+1): \(volume)m³")
            totalFurnitureVolume += volume
        }

        printDivider()

        //Calculate and print the leftover volume in the room
        let usableVolume = roomVolume - totalFurnitureVolume
        print("Usable Volume: \(usableVolume)m³")

        //Check if usable volume is less than 60m3, print warning if so
        if(usableVolume < minimumUsableVolume){
            print("Usable volume is not large enough.")
        } else {
            print("Usable volume is fine.")
        }

        printDivider()
        
        printGoodbye()
    }
}
