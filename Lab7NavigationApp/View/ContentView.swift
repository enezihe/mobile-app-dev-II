import SwiftUI

struct ContentView: View {
    
    let books = [
        "The Swift Programming Language",
        "Clean Code",
        "Atomic Habits",
        "The Alchemist",
        "Deep Work"
    ]
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("Welcome to the Multi-Screen Navigation App")
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.top)
                
                // Navigation to Info Screen
                NavigationLink(destination: InfoView()) {
                    Text("About This App")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                List(books, id: \.self) { book in
                    
                    NavigationLink(destination: DetailView(itemTitle: book)) {
                        Text(book)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
