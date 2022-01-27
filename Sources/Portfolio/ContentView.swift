import TokamakDOM
import Foundation

// MARK: - Content View
struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                RoundedRectangle(cornerRadius: 12)
                    .overlay(LinearGradient(colors: [.lightPurple, .lightBlue],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing))
                    .frame(minWidth: 200,
                           idealWidth: 300,
                           maxWidth: 300,
                           minHeight: 100,
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
                        .foregroundColor(.secondary)
                        .font(.caption)
                    Link(destination: URL(string: "https://github.com/TokamakUI/Tokamak")!) {
                        Text("Tokamak")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
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
}
