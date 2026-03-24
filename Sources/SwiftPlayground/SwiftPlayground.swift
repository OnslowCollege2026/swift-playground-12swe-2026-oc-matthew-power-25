// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Create a new array of the 4 possible answers, shuffled
func createAnswersArray(from array : [String]) -> [String] {
    var options:[String] = []
    for i in 1...4 {
        options.append(array[i])
    }
    options.shuffle()
    return options
}

/// Returns an integer between an inclusive upper and lower bound
func readNumber(prompt: String, from min : Int, to max: Int) -> Int 
{
    print(prompt)
    guard let userInput = readLine(), let userInt = Int(userInput), userInt >= min, userInt <= max else {
        print("Invalid input.")
        return readNumber(prompt: prompt, from: min, to: max)
    }
    return userInt
}

@main
struct SwiftPlayground {
    static func main() {
        // Constants and Variables
        /// Each array includes the english word, the answer in the target language and three wrong answers
        let vocabulary = [
            ["Hello",   "Hola",      "Gracias", "Lo Siento", "Bonjour"],
            ["Thanks",  "Gracias",   "Bueno",   "Tambien",   "Cinco"],
            ["Please",  "Por Favor", "Adios",   "Pollo",     "Siete"],
            ["Sorry",   "Lo Siento", "Si",      "Y tu",      "Ocho"],
            ["Goodbye", "Adios",     "Abrigo",  "Hola",      "Amigo"]
        ]

        /// The indices of the questions that the user got incorrect
        var incorrectIndices: [Int] = [] 

        /// The number of questions that the user got wrong
        var incorrectCount = 0

        /// The number of questions that have been asked
        var count = 0

        // Loop until all of the vocab questions have been asked

        while count < vocabulary.count {
            // Show the question
            print("Find the translation of \(vocabulary[count][0])")
            // list options in random order

            // Create an array of options and shuffle them
            let options = createAnswersArray(from: vocabulary[count])

            for (index, option) in options.enumerated() {
                print("\(index+1). \(option)")
            }

            // Get the users input
            let inputInt = readNumber(prompt: "Enter an answer as an integer:", from: 1, to: 4)

            // Check if the answer was correct
            if(options[inputInt-1] == vocabulary[count][1]) {
                print("Correct!")
            } else {
                // If not, take note of the question to ask later
                print("Incorrect.")
                incorrectCount += 1
                incorrectIndices.append(count)
                // And print the correct answer
                print("The correct answer was \(vocabulary[count][1]).")
            }

            count += 1
        }

        // Loop through all incorrect questions
        while incorrectIndices.count > 0 
        {
            for incorrectIndex in incorrectIndices {
                // Show the question
                print("Find the translation of \(vocabulary[incorrectIndex][0])")
                // list options in random order

                // Create an array of options and shuffle them
                let options = createAnswersArray(from: vocabulary[incorrectIndex])

                for (index, option) in options.enumerated() {
                    print("\(index+1). \(option)")
                }

                // Get the users input
                let inputInt = readNumber(prompt: "Enter an answer as an integer:", from: 1, to: 4)

                // Check if the answer was correct
                if(options[inputInt-1] == vocabulary[incorrectIndex][1]) {
                    print("Correct!")
                    // Remove the question from the incorrect array
                    let positionIn = incorrectIndices.firstIndex(of: incorrectIndex)
                    incorrectIndices.remove(at: positionIn!)
                } else {
                    // Otherwise print the answer
                    print("Incorrect.")
                    print("The correct answer was \(vocabulary[incorrectIndex][1]).")
                }
            }
        }

        //Print the number of mistakes
        print("Overall, you made \(incorrectCount) mistakes.")
    }
}
