import TokamakDOM
import Foundation

// MARK: Content View
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

// MARK: - Works View
enum WorkType: String {
    case research = "📃"
    case award = "🏅"
    case externalFounding = "💰"
}

struct WorksItemView: View {
    var citation: String
    var workType: WorkType
    
    var body: some View {
        HStack(spacing: 20) {
            Text(workType.rawValue)
            Text(citation)
        }
    }
}

struct CitationWorksItemView: View {
    var bibTeX: BibTeX
    var workType: WorkType = .research
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Text(workType.rawValue)
            
            
            VStack(alignment: .leading, spacing: 5) {
                if let doi = bibTeX.doi {
                    Link(destination: URL(string: doi)!) {
                        Text(bibTeX.title)
                    }
                } else {
                    Text(bibTeX.title)
                }
                Text(bibTeX.author.joined(separator: ", "))
                    .foregroundColor(.secondary)
                    .font(.footnote)
                if bibTeX.type == .article {
                    Text(bibTeX.journal!)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                } else if bibTeX.type == .proceeding {
                    Text(bibTeX.bookTitle!)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                }
                
                DisclosureGroup {
                    Text(bibTeX.cite())
                        .foregroundColor(.secondary)
                        .font(.footnote)
                } label: {
                    Text("BibTeX")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

            }
        }
    }
}

struct WorksView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Journal")
                    .font(.title2)
                CitationWorksItemView(bibTeX: BibTeX(forArticle: "sksensors2021",
                                                       author: ["S. Kobayashi", "T. Hasegawa"],
                                                       title: " Detection of Motion on a Trampoline with a Smartwatch",
                                                       journal: "Sensors", volume: 24, number: nil, pages: nil, year: 2021,
                                                       doi: "https://doi.org/10.3390/s21248413"))
                
                CitationWorksItemView(bibTeX: BibTeX(forArticle: "sksm2021",
                                                       author: ["S. Kobayashi", "T. Hasegawa"],
                                                       title: "Smartphone-based Estimation of Sidewalk Surface Type via Deep Learning",
                                                       journal: "Sensors and Materials", volume: 33, number: 1, pages: 35...51, year: 2019,
                                                       doi: "https://doi.org/10.18494/SAM.2021.2976"))
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("Conference")
                    .font(.title2)
                CitationWorksItemView(bibTeX: BibTeX(forProceeding: "skdicomo2021",
                                                       author: ["小林慧", "長谷川達人"],
                                                       title: "スマートウォッチを用いたトランポリン上の動作検出",
                                                       bookTitle: "マルチメディア，分散，協調とモバイルシンポジウム 2021 論文集",
                                                       pages: 1310...1317, year: 2021, doi: nil))
                CitationWorksItemView(bibTeX: BibTeX(forProceeding: "skdicomo2020",
                                                       author: ["小林慧", "長谷川達人"],
                                                       title: "深層学習を用いたスマートフォンセンシングによる歩行時の路面種別推定",
                                                       bookTitle: "マルチメディア，分散，協調とモバイルシンポジウム 2020 論文集",
                                                       pages: 206...212, year: 2020, doi: nil))
                CitationWorksItemView(bibTeX: BibTeX(forProceeding: "skicit2019",
                                                       author: ["S. Kobayashi", "R. Katsurada", "T. Hasegawa"],
                                                       title: "Estimation of Sidewalk Surface Type with a Smartphone",
                                                       bookTitle: "Proceedings of the 7th International Conference on Information Technology: IoT and Smart City",
                                                       pages: 497...502, year: 2019, doi: "https://doi.org/10.1145/3377170.3377263"))
                CitationWorksItemView(bibTeX: BibTeX(forProceeding: "skjhes2019",
                                                       author: ["小林慧", "桂田連", "長谷川達人"],
                                                       title: "スマートフォンの加速度センサを用いた歩行時の道路の種類推定",
                                                       bookTitle: "2019年度電気・情報関係学会北陸支部連合大会",
                                                       pages: nil, year: 2019, doi: nil))
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("Award")
                    .font(.title2)
                WorksItemView(citation: "優秀論文発表賞, 情報処理学会北陸支部, 令和元年度電気関係学会北陸支部連合大会, 2019.8.", workType: .award)
                WorksItemView(citation: "ヤングリサーチャー賞, マルチメディア，分散，協調とモバイル(DICOMO2021)シンポジウム, 2021.7.", workType: .award)
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("External funding")
                    .font(.title2)
                WorksItemView(citation: "科学技術融合振興財団 補助金助成, 採択額: 120千円, \"ウェアラブルデバイスを用いた\nトランポリン運動を促進するエンタテイメントシステム\", 2021.1.", workType: .externalFounding)
            }
            .padding(.vertical, 10)
        }
        .padding(.vertical, 20)
    }
}


// MARK: - extention Color
extension Color {
    static let lightBlue = Color(.sRGB, red: 0.655, green: 0.925, blue: 0.949, opacity: 1.0)
    static let lightPurple = Color(.sRGB, red: 0.568, green: 0.663, blue: 0.871, opacity: 1.0)
}
