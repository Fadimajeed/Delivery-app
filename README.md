# Food Delivery App

## Project Overview

This is a full-featured Flutter mobile application simulating a food delivery service. It allows users to browse a dynamic menu, add items to a cart, manage quantities, proceed to checkout with payment simulation, and track their order delivery progress. The application integrates Firebase for user authentication and real-time data management, showcasing a robust and scalable architecture.

## Features

*   **User Authentication:** Secure sign-up and login using Firebase Authentication.
*   **Dynamic Menu:** Browse a categorized menu with food items, descriptions, prices, and customizable add-ons.
*   **Shopping Cart:** Add, remove, and update quantities of food items in the cart.
*   **Order Management:** Simulate order placement and track delivery progress.
*   **Payment Simulation:** A dedicated payment page with credit card input simulation (using `flutter_credit_card`).
*   **Real-time Database:** Utilizes Firebase Firestore for storing and managing order data.
*   **Theming:** Supports light and dark modes with a custom theme provider.
*   **Responsive UI:** Designed to provide a consistent and appealing user experience across various screen sizes.
*   **Custom Widgets:** Reusable UI components for a clean and modular codebase.

## Technologies Used

*   **Flutter SDK:** For cross-platform mobile application development.
*   **Dart Language:** The primary programming language.
*   **Firebase:**
    *   **Firebase Authentication:** For user registration and login.
    *   **Cloud Firestore:** For real-time database operations (e.g., saving orders).
*   **Provider:** For efficient state management across the application.
*   **`flutter_credit_card`:** For credit card UI and input handling.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Make sure you have Flutter installed on your machine. If not, follow the official Flutter installation guide: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

Also, ensure you have a Firebase project set up and linked to your Flutter application. You will need to replace the `firebase_options.dart` file with your own Firebase configuration.

### Installation

1.  Clone the repository:
    ```bash
    git clone <repository_url>
    ```
2.  Navigate to the project directory:
    ```bash
    cd food_delivery_app
    ```
3.  Get Flutter packages:
    ```bash
    flutter pub get
    ```
4.  Run the application:
    ```bash
    flutter run
    ```

## Project Structure

```
lib/
├── main.dart
├── Services/
│   ├── Auth/
│   │   ├── auth_gate.dart
│   │   └── auth_service.dart
│   └── Database/
│       └── firestore.dart
├── Themes/
│   ├── dark_mode.dart
│   ├── light_mode.dart
│   └── theme_provider.dart
├── Pages/
│   ├── cart_page.dart
│   ├── delivery_progress_page.dart
│   ├── food_page.dart
│   ├── home_page.dart
│   ├── login_page.dart
│   ├── pyment_page.dart
│   ├── regester_page.dart
│   └── settings_page.dart
├── model/
│   ├── cart_item.dart
│   ├── food.dart
│   └── restaurant.dart
└── Extras/
    ├── cart_tile.dart
    ├── current_location.dart
    ├── description_box.dart
    ├── drawer.dart
    ├── drawer_tiles.dart
    ├── food_tile.dart
    ├── quantity_selector.dart
    ├── receipt.dart
    ├── sign_in_button.dart
    ├── sliver_app_bar.dart
    ├── tab_bar.dart
    └── text_field.dart
```

## State Management

This project extensively uses the **Provider** package for state management. `ChangeNotifierProvider` is utilized to manage the application's global state, such as the `ThemeProvider` for theme switching and the `Restaurant` model for managing the menu, cart, and order-related data. This approach ensures efficient and predictable state updates across the application, promoting a clean and maintainable codebase.

## Screenshots

![Login Page](https://github.com/Fadimajeed/Delivery-app/blob/master/delivery-app-imges/Screenshot_1751328013.png?raw=true)
![Home Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143203.png?raw=true)
![Menu Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143224.png?raw=true)
![Cart Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143234.png?raw=true)
![Payment Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143255.png?raw=true)
![Delivery Progress Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143243.png?raw=true)
![Settings Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143217.png?raw=true)
![Register Page](https://github.com/Fadimajeed/Delivery_app/blob/master/delivery-app-images/Screenshot2025-06-23143308.png?raw=true)

## Contributing

Contributions are welcome! Please feel free to fork the repository and submit pull requests.

## License

This project is licensed under the MIT License.
