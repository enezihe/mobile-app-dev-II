import SwiftUI

struct DetailView: View {
    
    // Receives the selected item title from the Home screen
    let itemTitle: String
    
    // Used to return to the previous screen
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // Title label
            Text("Selected Item:")
                .font(.headline)
            
            // Displays the item passed from Home screen
            Text(itemTitle)
                .font(.title2)
                .fontWeight(.bold)
            
            // Button to return to Home screen
            Button("Go to Home") {
                dismiss()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            // Navigation button to Info screen
            NavigationLink(destination: InfoView()) {
                Text("Go to Info Screen")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
    }
}

#Preview {
    DetailView(itemTitle: "Sample Book")
}
