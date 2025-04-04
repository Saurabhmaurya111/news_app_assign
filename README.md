# News App

A Flutter-based news application that fetches the latest headlines from the News API and displays them in a user-friendly interface. Users can click on a news item to open the full article in a WebView.

## Features
- Fetches top headlines using the [NewsAPI](https://newsapi.org/).
- Displays articles with images, titles, and sources.
- Refresh button to fetch the latest news.
- Supports light and dark themes.
- Clicking on a news item opens the full article in a WebView.

## Screenshots
<img src="assets/login.jpg" alt="Login Screen" width="400" style="height: auto; max-height: 300px;" />
<img src="assets/feeds.jpg" alt="Feeds Screen" width="400" style="height: auto; max-height: 300px;" />
<img src="assets/dark_mode_feeds.jpg" alt="Dark Mode Feeds" width="400" style="height: auto; max-height: 300px;" />
<img src="assets/web1.jpg" alt="WebView 1" width="400" style="height: auto; max-height: 300px;" />
<img src="assets/web2.jpg" alt="WebView 2" width="400" style="height: auto; max-height: 300px;" />

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/Saurabhmaurya111/news_app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd news_app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## API Setup

1. Get your API key from [NewsAPI](https://newsapi.org/).
2. Replace `apiKey` in `NewsFeedPage` with your API key:
   ```dart
   const apiKey = 'YOUR_API_KEY_HERE';
   ```

## Dependencies
- `flutter`
- `provider`
- `http`
- `flutter_webview_plugin`

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Author
[Saurabh Maurya](https://github.com/Saurabhmaurya111)