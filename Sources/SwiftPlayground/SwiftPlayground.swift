// The Swift Programming Language
// https://docs.swift.org/swift-book

func showArea() {
    // declare three constants
    let width = 4.0
    let length = 3.6
    let height = 5.3
    // calculate area and print it
    let volume = width * length * height
    print("Volume: \(volume)")
}

// try to print the area here


@main
struct SwiftPlayground {
    static func main() {
    
    if true {
        let note = "Inside"
    }
    //print(note)

    var status = ""
    if true {
        status = "abcdefg"
    }
    print(status)

    showArea()
    //print(volume)

    let isLarge = false

    if isLarge {
        // declare a label and print it
        let label = "big"
        print(label)
    } else {
        // declare a label and print it
        let label = "small"
        print(label)
    }

    // try to print label here
    //print(label)

    }
}
