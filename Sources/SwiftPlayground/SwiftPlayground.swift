// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        //Declare variables to be edited, with -1 as a default if input is invalid
        var roomLength = -1.0
        var roomWidth = -1.0
        var roomHeight = -1.0

        //Declare furniture sizes in an array
        let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]

        //Get Dimensions
        while(roomLength <= 0.0){
            print("Enter Room Length:")
            if let input = readLine(), let length = Double(input), length > 0.0{
                roomLength = length
                print("Accepted Length: \(length)m")
            } else {
                print("Invalid input.")
            } 
        }

        while(roomWidth <= 0.0){
            print("Enter Room Width:")
            if let input = readLine(), let width = Double(input), width > 0.0{
                roomWidth = width
                print("Accepted Width: \(width)m")
            } else {
                print("Invalid input.")
            }
        }

        while(roomHeight <= 0.0){
            print("Enter Room Height:")
            if let input = readLine(), let height = Double(input), height > 0.0{
                roomHeight = height
                print("Accepted Height: \(height)m")
            } else {
                print("Invalid input.")
            }
        }

        //Calculate and print the area of the room
        let roomArea = roomLength * roomWidth
        print("Room area: \(roomArea)m²")

        //Do the same again for volume
        let roomVolume = roomArea * roomHeight
        print("Room volume: \(roomVolume)m³")

        //Loop through furniture
        ///The total volume of furniture
        var totalFurnitureVolume = 0.0 
        for (index, furniture) in furnitureVolumes.enumerated(){
            if (furniture > 2.0){
                print("Oversized Furniture Detected")
            }
            print("Item \(index+1): \(furniture)m³")
            totalFurnitureVolume += furniture
        }

        //Calculate and print the leftover volume in the room
        let usableVolume = roomVolume - totalFurnitureVolume
        print("Usable Volume: \(usableVolume)m³")

        //Check if usable volume is less than 60m3, print warning if so
        if(usableVolume < 60.0){
            print("Usable volume is not large enough.")
        } else {
            print("Usable volume is fine.")
        }
    }
}
