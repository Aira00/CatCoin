import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CryptoListScreen()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Coins")
                }
            
            StatisticsScreen()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Stats")
                }
        }
    }
}


