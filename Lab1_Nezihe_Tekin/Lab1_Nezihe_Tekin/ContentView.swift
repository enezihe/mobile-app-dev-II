import SwiftUI

enum Answer {
    case prime
    case notPrime
}

struct ContentView: View {
    @State private var currentNumber: Int = Int.random(in: 1...200)

    var body: some View {
        VStack(spacing: 24) {
            Text("Prime Checker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("\(currentNumber)")
                .font(.system(size: 90, weight: .heavy))

            VStack(spacing: 16) {
                answerRow(title: "Prime")
                answerRow(title: "Not Prime")
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    private func answerRow(title: String) -> some View {
        Button {
            // No logic yet
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
    }

    // MARK: - Prime Check
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
