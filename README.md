# 📊 CatCoin — Cryptocurrency iOS App

## 📚 iOS Programmering (PG5601)
**Grade:** C  
**Course:** iOS Programmering  
**Semester:** Spring 2025  
**GitHub Repository:** [https://github.com/Aira00/CatCoin](https://github.com/Aira00/CatCoin)

An iOS app built in **SwiftUI**, using data from the **CoinLore API** to display global cryptocurrency stats, live tickers, and market trends — optimized for different iPhone screen sizes.

---

## Features

- 🏠 **Home Tab:**
  - Displays global market data from `https://api.coinlore.net/api/global/`
  - Scrollable list with **pull-to-refresh**
  - Network error handling with clear error messages and visual indicators

- 💸 **Cryptocurrencies Tab:**
  - List of cryptocurrencies from `https://api.coinlore.net/api/tickers/`
  - Sorting options: rank, 1h change, 24h change, 7d change (ascending/descending)
  - Detail view for each cryptocurrency
  - Correct currency formatting (e.g., `$400.56`)

- 📊 **Statistics Tab:**
  - Shows 1h, 24h, and 7d performance for selected cryptocurrencies
  - Filter to choose which coins to track
  - **Persistent user settings** — remembers your selection after restarting the app

---

## Built With

- **SwiftUI**
- **Combine** for reactive data handling
- **URLSession** for API calls
- **UserDefaults** for data persistence
- **CocoaPods/SPM** (optional for chart libraries)

---

## Notes

- Compatible with **Xcode 15+**, **Swift 5.9**.
- Designed to be **responsive across all iPhone screen sizes**.
- **No backend**, data fetched directly from **CoinLore API**.
- **No 3rd-party UI frameworks**, except optional chart libraries via CocoaPods/SPM.

---

## Sources & References

- CoinLore API: [https://www.coinlore.com/cryptocurrency-data-api](https://www.coinlore.com/cryptocurrency-data-api)
- Apple Developer Documentation
- Public SwiftUI resources (noted in code comments if applicable)

---

## Contact

More projects on [GitHub](https://github.com/Aira00).

