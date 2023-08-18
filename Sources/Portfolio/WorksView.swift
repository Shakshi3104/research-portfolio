import TokamakDOM
import Foundation

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
                        .padding(.vertical, 10)
                } label: {
                    Text("BibTeX")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
            }
        }
    }
}

// MARK: -  Works View
struct WorksView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Journal")
                    .font(.title2)
                CitationWorksItemView(bibTeX: BibTeX(forArticle: "marnasnet2023",
                                                     author: ["S. Kobayashi", "T. Hasegawa", "T. Miyoshi", "M. Koshino"],
                                                     title: "MarNASNets: Toward CNN Model Architectures Specific to Sensor-Based Human Activity Recognition",
                                                     journal: "IEEE Sensors Journal",
                                                     volume: 23, number: 16, pages: 18708...18717, year: 2023,
                                                    doi: "https://doi.org/10.1109/JSEN.2023.3292380"))
                CitationWorksItemView(bibTeX: BibTeX(forArticle: "projectxieee2022",
                                                     author: ["Z. Zhongkai", "S. Kobayashi", "K. Kondo", "T. Hasegawa", "M. Koshino"],
                                                     title: "A Comparative Study: Toward an Effective Convolutional Neural Network Architecture for Sensor-Based Human Activity Recognition",
                                                     journal: "IEEE Access", volume: 10, number: nil, pages: 20457...20558, year: 2022,
                                                     doi: "https://doi.org/10.1109/ACCESS.2022.3152530"))
                
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
                CitationWorksItemView(bibTeX: BibTeX(forProceeding: "skipsj84",
                                                     author: ["小林慧", "長谷川達人"],
                                                     title: "Mobile-aware Convolutional Neural Network for Sensor-based Human Activity Recognition",
                                                     bookTitle: "情報処理学会 第84回全国大会",
                                                     pages: nil, year: 2022, doi: nil))
                
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

