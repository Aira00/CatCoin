import SwiftUI

struct HomeScreen: View {
    @State private var marketData: GlobalMarketData?
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView("Fetching Market Data...")
                } else if let data = marketData {
                    List {
                        Text("Total Coins: \(data.coins_count)")
                        Text("Active Markets: \(data.active_markets)")
                        Text("Total Market Cap: $\(Int(data.total_mcap))")
                    }
                    .refreshable {
                        fetchData()
                    }
                } else {
                    Text("Error fetching data. Please try again.")
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Overview")
            .onAppear {
                fetchData()
            }
        }
    }

    private func fetchData() {
        CryptoAPI.shared.getGlobalMarketData { data in
            self.marketData = data
            self.isLoading = false
        }
    }
}
