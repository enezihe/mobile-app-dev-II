import SwiftUI

enum Answer {
    case prime
    case notPrime
}

struct ContentView: View {
    @State private var currentNumber: Int = Int.random(in: 1...200)

    @State private var correctCount: Int = 0
    @State private var wrongCount: Int = 0
    @State private var attemptCount: Int = 0

    @State private var selectedAnswer: Answer? = nil
    @State private var showFeedback: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Prime Checker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("\(currentNumber)")
                .font(.system(size: 90, weight: .heavy))

            VStack(spacing: 16) {
                answerRow(title: "Prime", answer: .prime)
                answerRow(title: "Not Prime", answer: .notPrime)
            }
            .padding(.horizontal)

            HStack(spacing: 18) {
                Text("Correct: \(correctCount)")
                Text("Wrong: \(wrongCount)")
            }
            .font(.subheadline)

            Spacer()
        }
        .padding()
    }

    private func answerRow(title: String, answer: Answer) -> some View {
        Button {
            submit(answer)
        } label: {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.9))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
        .disabled(selectedAnswer != nil)
    }

    // MARK: - Submit (evaluate + score)
    private func submit(_ answer: Answer) {
        selectedAnswer = answer
        showFeedback = true
        recordResult(isCorrect: isAnswerCorrect(answer))
    }

    private func recordResult(isCorrect: Bool) {
        attemptCount += 1
        if isCorrect { correctCount += 1 } else { wrongCount += 1 }
    }

    private func isAnswerCorrect(_ answer: Answer) -> Bool {
        let prime = isPrime(currentNumber)
        switch answer {
        case .prime: return prime
        case .notPrime: return !prime
        }
    }

    // Prime Check
    private func isPrime(_ n: Int) -> Bool {
        if n < 2 { return false }
        if n == 2 { return true }
        if n % 2 == 0 { return false }

        var i = 3
        while i * i <= n {
            if n % i == 0 { return false }
            i += 2
        }
        return true
    }
}

#Preview {
    ContentView()
}
