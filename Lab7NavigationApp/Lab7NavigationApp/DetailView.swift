import SwiftUI

struct DetailView: View {
    
    // Receives the selected item title from the Home screen
    let itemTitle: String
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            // Title label
            Text("Selected Item:")
                .font(.headline)
            
            // Displays the item passed from Home screen
            Text(itemTitle)
                .font(.title2)
                .fontWeight(.bold)
            
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
