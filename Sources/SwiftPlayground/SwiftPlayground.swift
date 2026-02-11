// The Swift Programming Language
// https://docs.swift.org/swift-book

func volume(length: Double, width: Double, height: Double) -> Double {
    let volume = length * width * height
    return volume
}

func area(length: Double, width: Double) -> Double {
    let area = length * width
    return area
}

@main
struct SwiftPlayground {
    static func main() {
    
        let roomLength = 3.6
        let roomWidth = 4.3
        let roomHeight = 5.3
        
        print("Room Area: \(area(length: roomLength, width: roomWidth)) m²")
        
        print("Room Volume: \(volume(length: roomLength, width: roomWidth, height: roomHeight)) m²")
    }
}
