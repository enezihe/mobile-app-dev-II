import SwiftUI

struct ContentView: View {

    @State private var output: Int = 0
    @State private var step: Int = 2

    var body: some View {
        VStack(spacing: 18) {

            // Title
            Text("Lab Exercise")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            // Main card
            ZStack {
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color(red: 0.98, green: 0.90, blue: 0.65)) //yellow
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.blue.opacity(0.7), lineWidth: 1.5)
                    )

                VStack(spacing: 18) {

                    // Logo
                    Image("gbc_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 90)
                        .padding(.top, 10)
                        .accessibilityLabel("App Logo")

                    // Output "TextBox"
                    Text("\(output)")
                        .font(.system(size: 36, weight: .bold))
                        .frame(width: 140, height: 55)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.15), lineWidth: 1)
                        )
                        .accessibilityLabel("Output")

                    // +/- buttons
                    HStack(spacing: 22) {
                        Button(action: subtract) {
                            Text("-")
                                .font(.system(size: 28, weight: .bold))
                                .frame(width: 95, height: 52)
                                .background(Color.gray.opacity(0.55))
                                .foregroundColor(.black)
                                .cornerRadius(6)
                        }
                        .accessibilityLabel("Subtract Button")

                        Button(action: add) {
                            Text("+")
                                .font(.system(size: 28, weight: .bold))
                                .frame(width: 95, height: 52)
                                .background(Color.gray.opacity(0.55))
                                .foregroundColor(.black)
                                .cornerRadius(6)
                        }
                        .accessibilityLabel("Add Button")
                    }

                    // Reset + Step buttons
                    HStack(spacing: 22) {

                        Button(action: reset) {
                            Text("Reset")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 95, height: 46)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                        }
                        .accessibilityLabel("Reset Button")

                        Button(action: toggleStep) {
                            Text("Step = \(step)")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 95, height: 46)
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                        }
                        .accessibilityLabel("Step Button")
                    }

                    Spacer(minLength: 8)
                }
                .padding(.vertical, 10)
            }
            .frame(width: 300, height: 420)

            Spacer()
        }
        .padding()
    }

    private func add() {
        output += step
    }

    private func subtract() {
        output -= step
    }

    private func reset() {
        output = 0
    }

    private func toggleStep() {
        step = (step == 1) ? 2 : 1
    }
}

#Preview {
    ContentView()
}

