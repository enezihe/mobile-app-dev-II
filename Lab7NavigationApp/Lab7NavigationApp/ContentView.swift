import SwiftUI

struct ContentView: View {
    
    // books of the list
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
