// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Calculates the volume of a room
/// Paramaters:
/// - length: The length of the room, in metres
/// - width: The width of the room in metres
/// - height: The height of the room in metres
/// Returns: the volume in cubic meters
func volume(length: Double, width: Double, height: Double) -> Double {
    let volume = length * width * height
    return volume
}

/// Calculates the area of a room
/// Paramaters:
/// - length: The length of the room, in metres
/// - width: The width of the room in metres
/// Returns: the area in square meters
func area(length: Double, width: Double) -> Double {
    let area = length * width
    return area
}

/// Checks if a room is of adequate size
/// Parameters:
/// - volume: the volume of the room in cubic meters
/// Returns: Returns yes if the room is too small, being under 60 cubic meters. returns no otherwise
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}

/// Reduces the height of the room by a percentage
/// Parameters:
/// - original: the height of the room before reduction
/// - reductionPercent: the percentage to reduce the height by
/// Returns: the height of the room after reduction
func reducedHeight(original: Double, reductionPercent: Double) -> Double {
    let multiplier = (100.0 - reductionPercent) / 100.0
    return original * multiplier
}

@main
struct SwiftPlayground {
    static func main() {
    
        // Declare constants for room dimensions
        let roomLength = 3.6
        let roomWidth = 4.3
        let roomHeight = 4.4
        // Percentage to reduce the height of the room by
        let reductionPercent = 15.0

        // Calculate the reduced height of the room
        let reducedHeight = reducedHeight(original: roomHeight, reductionPercent: reductionPercent)
        
        // Calculate and print the area of the room
        let roomArea = area(length: roomLength, width: roomWidth)
        print("Room Area: \(roomArea) m²")
        
        // Calculate and print the volume of the room
        let roomVolume = volume(length: roomLength, width: roomWidth, height: roomHeight)
        print("Room Volume: \(roomVolume) m²")

        // Calculate and print the volume of the room, with the reduced height
        let reducedHeightVolume = volume(length: roomLength, width: roomWidth, height: reducedHeight)
        print("Room volume with reduced height: \(reducedHeightVolume) m²")

        // Warn the user that the room is too small if the reduced volume is under 60 cubic meters
        if(isRoomSmall(volume: reducedHeightVolume)){
            print("Room is small")
        } else {
            print("Room is not small")
        } 
    }
}
