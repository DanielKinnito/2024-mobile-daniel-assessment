# Mobile Assessment for Daniel Mekonnen
### Objective: 
Your task is to implement a grocery shopping app using Flutter, replicating the design provided in the attached Figma file. This assessment will evaluate your ability to apply clean architecture principles, implement core functionalities, and effectively use BLoC for state management.

# Table of contents
| Task Progress| Screenshots|
|--------------|------------|
|[Task Progress](#task-progress)| [screenshots](#screenshots)|


## Task Progress

### Requirements:
1. Architecture:
The application must be developed following the principles of clean architecture. This means separating the codebase into different layers (presentation, domain, and data layers) to ensure scalability, maintainability, and testability.

2. State Management:
Use BLoC (Business Logic Component) for state management across the application. This should handle all state changes in a predictable manner, ensuring that the UI updates appropriately based on user interactions and data changes.

3. UI Implementation:
All pages provided in the Figma design must be fully implemented, with the exception of the "My Basket" page, which is optional. Ensure that the UI closely follows the design specifications, including layout, color scheme, typography, and user experience elements.
For UI elements where no APIs are provided, you may use static data or assets for your implementation. This includes any dummy data, images, or placeholders needed to complete the design.

4. API Integration:
The application must integrate with the provided API to fetch grocery data. Proper error handling, loading states, and response parsing are expected.
API Documentation: The necessary API documentation are provided, detailing endpoints, request formats, and expected responses.

5. Features:
Display Products: Display products after fetching from the provided API.
Cart Management: Implement functionality for users to add items to the cart, update quantities, and view the cart.
Support Routing: Ensure smooth routing between different pages within the app.

6. Package Recommendations:
Bottom Navigation: Consider using flutter_bottom_navigation_bar or similar packages.
Splash Screen: The flutter_native_splash package is recommended for implementing splash screens.
Dependency Injection: Use get_it or injectable for dependency injection to manage your app's dependencies effectively.
Network Requests: The HTTP package is recommended for handling API requests and network interactions.

### Task Completion
- Task 1 ✔️
- Task 2 ✔️
- Task 3 ✔️
- Task 4 ✔️
- Task 5 ✔️
- Task 6 ✔️

## Screenshots
| Splash Screen| Home Page| My Basket|
|--------------| ---------|----------|
|![splash](https://github.com/user-attachments/assets/b1022bdd-a5bd-48af-b2c1-5f379c0cab7e)| ![home](https://github.com/user-attachments/assets/97a39836-16f7-4965-9ceb-fd813dfb8e11)| ![image](https://github.com/user-attachments/assets/5ca5b914-67db-4fb0-ac56-2a78cd84bd73)|

|Details Page 1|Details Page 2|Details Page 3|
|--------------| -------------|--------------|
|![image](https://github.com/user-attachments/assets/2e58e2e7-2b9a-4e4f-96e5-9659e50296e2)|![image](https://github.com/user-attachments/assets/75cde328-37da-45f9-811a-d4556d0427c6)|![image](https://github.com/user-attachments/assets/18741aa0-0989-4215-b0fd-6216d19c0b82)|
