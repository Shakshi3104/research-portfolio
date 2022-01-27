import TokamakDOM
import Foundation

// MARK: - Content View
struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                Rectangle()
                    .overlay(LinearGradient(colors: [.lightPurple, .lightBlue],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing))
                    .frame(minHeight: 100,
                           idealHeight: 200,
                           maxHeight: 200,
                           alignment: .center)
                    .padding(.vertical, 20)
                    
                ProfileView()
                
                Divider()
                
                WorksView()
                
                Divider()
                
                LinksView()
                
                Divider()
                
                HStack(spacing: 5) {
                    Text("Powered by")
                        
                    Link(destination: URL(string: "https://github.com/TokamakUI/Tokamak")!) {
                        Text("Tokamak")
                            .foregroundColor(.tokamakOrange)
                    }
                    Text("and")
                    Link(destination: URL(string: "https://github.com/swiftwasm")!) {
                        Text("SwiftWasm")
                            .foregroundColor(.swiftWasmOrange)
                    }
                }
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.vertical, 10)
                
            }
            .padding(20)
        }
    }
}


// MARK: - extention Color
extension Color {
    static let lightBlue = Color(.sRGB, red: 0.655, green: 0.925, blue: 0.949, opacity: 1.0)
    static let lightPurple = Color(.sRGB, red: 0.568, green: 0.663, blue: 0.871, opacity: 1.0)
    static let tokamakOrange = Color(.sRGB, red: 0.776, green: 0.420, blue: 0.227, opacity: 1.0)
    static let swiftWasmOrange = Color(.sRGB, red: 0.941, green: 0.318, blue: 0.220, opacity: 1.0)
}
