import SwiftUI

struct CryptoListScreen: View {
    @State private var cryptos: [CryptoCurrency] = []
    @State private var sortOption: SortOption = .ranking

    enum SortOption {
        case ranking, change1h, change24h, change7d
    }

    var sortedCryptos: [CryptoCurrency] {
        switch sortOption {
        case .ranking:
            return cryptos
        case .change1h:
            return cryptos.sorted { Double($0.percent_change_1h) ?? 0 > Double($1.percent_change_1h) ?? 0 }
        case .change24h:
            return cryptos.sorted { Double($0.percent_change_24h) ?? 0 > Double($1.percent_change_24h) ?? 0 }
        case .change7d:
            return cryptos.sorted { Double($0.percent_change_7d) ?? 0 > Double($1.percent_change_7d) ?? 0 }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort by", selection: $sortOption) {
                    Text("Ranking").tag(SortOption.ranking)
                    Text("1h Change").tag(SortOption.change1h)
                    Text("24h Change").tag(SortOption.change24h)
                    Text("7d Change").tag(SortOption.change7d)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List(sortedCryptos, id: \.id) { coin in
                    NavigationLink(destination: CryptoDetailScreen(crypto: coin)) {
                        HStack {
                            Text(coin.name)
                                .font(.headline)
                            Spacer()
                            Text("$\(coin.price_usd)")
                                .bold()
                        }
                    }
                }
                .refreshable {
                    CryptoAPI.shared.getCryptoList { data in
                        self.cryptos = data
                    }
                }
                .navigationTitle("Cryptocurrencies")
            }
            .onAppear {
                CryptoAPI.shared.getCryptoList { data in
                    self.cryptos = data
                }
            }
        }
    }
}

