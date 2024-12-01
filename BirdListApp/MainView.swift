import SwiftUI

struct MainView: View {
    @State private var isNavigating = false  // State to manage navigation
    
    var body: some View {
        NavigationView {
            ZStack {
             
                Image("bird")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.3)
                
                VStack {
                    Spacer()
                    
                
                    VStack(spacing: 10) {
                        Text("ENDEMIC BIRDS")
                            .font(.system(size: 45, weight: .medium, design: .rounded))
                            .foregroundColor(Color.brown.opacity(1)) // Slightly off-white for better contrast
                            .shadow(radius: 5) // Adds shadow for better readability
                        
                        Text("SRI LANKA")
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                            .foregroundColor(Color.white)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                 
                    NavigationLink(destination: ContentView(), isActive: $isNavigating) {
                        Button(action: {
                            isNavigating = true
                        }) {
                            Text("START")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity)
                                .background(Color.brown)
                                //.background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                    }
                    .padding(.bottom, 50)
                    
                }
            }
        }
    }
}
