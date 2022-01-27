import TokamakDOM

// MARK: - Profile View
struct ProfileItemView: View {
    var key: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Text(key)
                .foregroundColor(.secondary)
            Text(value)
        }
    }
}


struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Satoshi Kobayashi")
                .font(.title)
            
            VStack(alignment: .leading) {
                ProfileItemView(key: "Affiliation",
                                value: "HaseLab (Mobile & Ubiqutious LAB), \nInformation Science, Foundamental Engineering for Knowledge-Based Society, \nGraduate School of Engineering, University of Fukui")
                ProfileItemView(key: "Research Theme", value: "On-device Sensor-based Human Activity Recognition")
            }
            .padding(.vertical, 20)
            
        }
    }
}
