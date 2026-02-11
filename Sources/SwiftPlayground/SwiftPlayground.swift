// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Calculates the volume of a room
/// paramaters:
/// - length: The length of the room, in metres
/// - width: The width of the room in metres
/// - height: The height of the room in metres
/// returns: the volume in cubic meters
func volume(length: Double, width: Double, height: Double) -> Double {
    let volume = length * width * height
    return volume
}

/// Calculates the area of a room
/// paramaters:
/// - length: The length of the room, in metres
/// - width: The width of the room in metres
/// returns: the area in square meters
func area(length: Double, width: Double) -> Double {
    let area = length * width
    return area
}

/// Checks if a room is of adequate size
/// parameters:
/// - volume: the volume of the room in cubic meters
/// returns: Returns yes if the room is too small, being under 60 cubic meters. returns no otherwise
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}

/// Reduces the height of the room by a percentage
/// parameters:
/// - original: the height of the room before reduction
/// - reductionPercent: the percentage to reduce the height by
/// returns: the height of the room after reduction
func reducedHeight(original: Double, reductionPercent: Double) -> Double {
    let multiplier = (100.0 - reductionPercent) / 100.0
    return original * multiplier
}

@main
struct SwiftPlayground {
    static func main() {
    
        let roomLength = 3.6
        let roomWidth = 4.3
        let roomHeight = 5.3
        
        let roomArea = area(length: roomLength, width: roomWidth)
        print("Room Area: \(roomArea) m²")
        
        let roomVolume = volume(length: roomLength, width: roomWidth, height: roomHeight)
        
        print("Room Volume: \(roomVolume) m²")

        if(isRoomSmall(volume: roomVolume)){
            print("Room is small")
        } else {
            print("Room is not small")
        } 
    }
}
