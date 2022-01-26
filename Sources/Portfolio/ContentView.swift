//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Pro M1 on 2022/01/26.
//

import TokamakDOM
import Foundation

// MARK: Content View
struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                RoundedRectangle(cornerRadius: 12)
                    .overlay(LinearGradient(colors: [.lightPurple, .lightBlue],
                                            startPoint: .trailing,
                                            endPoint: .leading))
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
    case journal = "📃"
    case internationalConference = "✈️"
    case japanConference = "🇯🇵"
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

struct WorksView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Journal")
                    .font(.title2)
                WorksItemView(citation: "S. Kobayashi and T. Hasegawa. Detection of Motion on a Trampoline with a Smartwatch. \nSensors, Vol. 21, Issue 24, ID. 8413, pp. 1-14, 2021.",
                              workType: .journal)
                WorksItemView(citation: "S. Kobayashi and T. Hasegawa. Smartphone-based Estimation of Sidewalk Surface Type \nvia Deep Learning. Sensors and Materials, Vol.33, No.1, pp.35-51, 2021.", workType: .journal)
            }
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("Conference")
                    .font(.title2)
                WorksItemView(citation: "小林慧, 長谷川達人. スマートウォッチを用いたトランポリン上の動作検出. マルチメディア，分散，\n協調とモバイルシンポジウム 2021 論文集, pp.1310-1317, 2021.", workType: .japanConference)
                WorksItemView(citation: "小林慧, 長谷川達人. 深層学習を用いたスマートフォンセンシングによる歩行時の路面種別推定. \nマルチメディア，分散，協調とモバイルシンポジウム 2020 論文集, pp. 206-212, 2020.", workType: .japanConference)
                WorksItemView(citation: "S. Kobayashi, R. Katsurada, and T. Hasegawa. Estimation of Sidewalk Surface Type with a Smartphone. \nIn Proceedings of the 7th International Conference on Information Technology: IoT and Smart City, \npp. 497–502. ACM, 2019.", workType: .internationalConference)
                WorksItemView(citation: "小林慧, 桂田連, 長谷川達人. スマートフォンの加速度センサを用いた歩行時の道路の種類推定.\n 2019年度電気・情報関係学会北陸支部連合大会, 2019.", workType: .japanConference)
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
