import SwiftUI
import Combine

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

    @State private var showSummaryAlert: Bool = false

    @State private var timeRemaining: Int = 5
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 24) {

            // App title
            Text("Prime Checker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            // Header / Timer + Attempt
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "clock.fill")
                    Text("Time: \(timeRemaining)s")
                }

                Spacer()

                Text("Attempt: \(attemptCount)")
            }
            .font(.headline)
            .padding(.horizontal)

            // Countdown progress bar
            ProgressView(value: Double(timeRemaining), total: 5)
                .padding(.horizontal)
                .tint(timeRemaining <= 2 ? .red : .blue)

            // Number card
            Text("\(currentNumber)")
                .font(.system(size: 90, weight: .heavy))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 8)
                .padding(.horizontal)

            // Answer buttons
            VStack(spacing: 16) {
                answerRow(title: "Prime", answer: .prime)
                answerRow(title: "Not Prime", answer: .notPrime)
            }
            .padding(.horizontal)

            // Score
            HStack(spacing: 18) {
                HStack(spacing: 6) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                    Text("Correct: \(correctCount)")
                }

                HStack(spacing: 6) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.red)
                    Text("Wrong: \(wrongCount)")
                }
            }
            .font(.subheadline)
            .padding(.top, 8)

            Spacer()
        }
        .padding(.bottom, 10)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.18), Color.white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .animation(.easeInOut(duration: 0.25), value: showFeedback)
        .onReceive(timer) { _ in
            tick()
        }
        .alert("Summary (10 Attempts)", isPresented: $showSummaryAlert) {
            Button("OK") { }
        } message: {
            Text("Correct: \(correctCount)\nWrong: \(wrongCount)")
        }
    }

    // UI Component
    @ViewBuilder
    private func answerRow(title: String, answer: Answer) -> some View {
        Button {
            submit(answer)
        } label: {
            let isSelected = (selectedAnswer == answer)
            let isLocked = (selectedAnswer != nil)

            HStack {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer()

                if showFeedback, selectedAnswer != nil {
                    let isCorrectForThisRow = isAnswerCorrect(answer)

                    Image(systemName: isCorrectForThisRow ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(isCorrectForThisRow ? .green : .red)
                        .opacity(isSelected ? 1.0 : 0.9)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                isLocked
                    ? (isSelected ? Color.blue.opacity(0.95) : Color.blue.opacity(0.65))
                    : Color.blue.opacity(0.90)
            )
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: isSelected ? 6 : 3)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(selectedAnswer != nil)
    }

    // Timer
    private func tick() {
        guard selectedAnswer == nil else { return }

        timeRemaining -= 1

        if timeRemaining <= 0 {
            recordResult(isCorrect: false)
            nextQuestion()
        }
    }

    // Submit
    private func submit(_ answer: Answer) {
        selectedAnswer = answer
        showFeedback = true

        recordResult(isCorrect: isAnswerCorrect(answer))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            nextQuestion()
        }
    }

    private func recordResult(isCorrect: Bool) {
        attemptCount += 1
        if isCorrect { correctCount += 1 } else { wrongCount += 1 }

        if attemptCount % 10 == 0 {
            showSummaryAlert = true
        }
    }

    private func nextQuestion() {
        currentNumber = Int.random(in: 1...200)
        selectedAnswer = nil
        showFeedback = false
        timeRemaining = 5
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
