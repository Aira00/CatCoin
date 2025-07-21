import SwiftUI

struct StatisticsScreen: View {
    @State private var cryptos: [CryptoCurrency] = []
    @State private var selectedCryptos: Set<String> = Set(UserDefaults.standard.stringArray(forKey: "selectedCryptos") ?? [])

    var filteredCryptos: [CryptoCurrency] {
        return cryptos.filter { selectedCryptos.contains($0.symbol) }
    }

    var body: some View {
        NavigationView {
            VStack {
                List(cryptos, id: \.id) { coin in
                    HStack {
                        Text(coin.name).bold()
                        Spacer()
                        Toggle("", isOn: Binding(
                            get: { selectedCryptos.contains(coin.symbol) },
                            set: { isSelected in
                                if isSelected {
                                    selectedCryptos.insert(coin.symbol)
                                } else {
                                    selectedCryptos.remove(coin.symbol)
                                }
                                UserDefaults.standard.set(Array(selectedCryptos), forKey: "selectedCryptos")
                            }
                        ))
                    }
                }
                .navigationTitle("Select Coins")

                List(filteredCryptos, id: \.id) { coin in
                    VStack(alignment: .leading) {
                        Text(coin.name).bold()
                        Text("1h: \(coin.percent_change_1h)%")
                        Text("24h: \(coin.percent_change_24h)%")
                        Text("7d: \(coin.percent_change_7d)%")
                    }
                }
            }
            .onAppear {
                CryptoAPI.shared.getCryptoList { data in
                    self.cryptos = data
                }
            }
        }
    }
}
