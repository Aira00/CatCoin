import SwiftUI

struct CryptoDetailScreen: View {
    let crypto: CryptoCurrency

    var body: some View {
        VStack(spacing: 20) {
            Text(crypto.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Symbol: \(crypto.symbol)")
                .font(.title2)
                .foregroundColor(.gray)

            Text("Price: $\(crypto.price_usd)")
                .font(.title)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("1h Change: \(crypto.percent_change_1h)%")
                Text("24h Change: \(crypto.percent_change_24h)%")
                Text("7d Change: \(crypto.percent_change_7d)%")
            }
            .font(.headline)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle(crypto.name)
    }
}
