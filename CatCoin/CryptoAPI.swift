import Foundation

struct GlobalMarketData: Codable {
    let coins_count: Int
    let active_markets: Int
    let total_mcap: Double
}

struct CryptoCurrency: Codable {
    let id: String
    let symbol: String
    let name: String
    let price_usd: String
    let percent_change_1h: String
    let percent_change_24h: String
    let percent_change_7d: String
}

struct CryptoListResponse: Codable {
    let data: [CryptoCurrency]
}

class CryptoAPI {
    static let shared = CryptoAPI()

    func getGlobalMarketData(completion: @escaping (GlobalMarketData?) -> Void) {
        guard let url = URL(string: "https://api.coinlore.net/api/global/") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let decodedData = try? JSONDecoder().decode([GlobalMarketData].self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData?.first)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }

    func getCryptoList(completion: @escaping ([CryptoCurrency]) -> Void) {
        guard let url = URL(string: "https://api.coinlore.net/api/tickers/") else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let decodedData = try? JSONDecoder().decode(CryptoListResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData?.data ?? [])
                }
            } else {
                completion([])
            }
        }.resume()
    }
}
