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
<img width="320" height="680" src="https://github.com/user-attachments/assets/a0b96a42-a3d5-49c6-bd6a-ae198a2b3d56" />
<img width="320" height="680" src="https://github.com/user-attachments/assets/3568d702-2301-4212-83dc-713cb17a92af" />
<img width="320" height="680" src="https://github.com/user-attachments/assets/bf9a5038-bf83-4ab1-9014-c9f78f00add3" />
<img width="320" height="680" src="https://github.com/user-attachments/assets/e4db4da6-ce02-4363-ae16-9a708c8ee395" />
<img width="320" height="680" src="https://github.com/user-attachments/assets/c0050528-54af-45d1-a916-78f6cb5ae1e9" />



