# BasketBall_Bulletin
Basketball Bulletin is a SwiftUI-based iOS application that displays basketball match schedules and live scores in a clean, collapsible UI. It integrates structured JSON data for teams and matches, and offers search functionality, team-specific branding, and responsive interaction.
🔧 Core Features:
✅ SwiftUI-based MVVM architecture

📅 Schedule Listing View
Matches are grouped by month/year and displayed in collapsible sections.
Sections auto-expand for the current date or based on user search.

🔍 Search Functionality
Real-time debounce-enabled search on team names, match title, arena name, or city.

🎨 Team Color Integration
Match cards dynamically style backgrounds based on the home team’s primary color.

📱 Custom UI Components
Reusable views such as MatchCardView, MatchButtonView, TeamView, MatchHeaderInfoView.
Tab navigation with Schedule and Games tabs.

💬 User Interaction
Button press includes smooth scaling animations for feedback.
Auto-hide and clear search UI when switching tabs.

⚡ Data Loading
Asynchronous data loading and merging using Task, with simulated network delay via JSONLoader.
Team logos are merged with match schedules based on team IDs.

🧪 Modern SwiftUI Patterns
Property wrappers like @StateObject, @Binding, @FocusState.
Use of onReceive, onChange, and Combine for reactive data flow.
