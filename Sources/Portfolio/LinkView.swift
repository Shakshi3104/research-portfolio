import TokamakDOM
import Foundation

// MARK: - Link View

struct SNSLinkView: View {
    var snsName: String
    var accountName: String
    var url: URL
    
    var body: some View {
        HStack {
            Text(snsName)
                .foregroundColor(.secondary)
            Link(accountName, destination: url)
        }
    }
}

struct LinksView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SNSLinkView(snsName: "GitHub",
                        accountName: "@Shakshi3104",
                        url: URL(string: "https://github.com/Shakshi3104")!)
            SNSLinkView(snsName: "Qiita",
                        accountName: "@Shakshi3104",
                        url: URL(string: "https://qiita.com/Shakshi3104")!)
            SNSLinkView(snsName: "Twitter",
                        accountName: "@A_Popping_3104",
                        url: URL(string: "https://twitter.com/A_Popping_3104")!)
            SNSLinkView(snsName: "Instagram", accountName: "@stsh3104i", url: URL(string: "https://instagram.com/stsh3104i")!)
        }
        .padding(.vertical, 20)
    }
}
