import SwiftUI

struct InfoView: View {
    
    // Used to dismiss the current screen
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // App title
            Text("About This App")
                .font(.title2)
                .fontWeight(.bold)
            
            // App description
            Text("This is a simple SwiftUI navigation app that demonstrates how to move between multiple screens and pass data.")
                .multilineTextAlignment(.center)
                .padding()
            
            // Button to return to previous screen
            Button("Go Back") {
                dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Info")
    }
}

#Preview {
    InfoView()
}
