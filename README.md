# My-Shop: Simple E-Commerce Flutter App

This is a basic Flutter e-commerce application using the [Fake Store API](https://fakestoreapi.com/) to demonstrate core e-commerce features.
The app includes a splash screen, login screen, category dashboard, product details screen, and cart screen.

##  Features

###  Splash Screen
- Displays the app logo and name with a fade-in animation.
- Navigates to the login screen after a 3-second delay.

###  Login Screen
- Email and password input fields with validation.
- Validates required fields and email format.
- Simulates login and navigates to the dashboard.

###  Dashboard (Category View)
- Fetches categories dynamically from the [Fake Store API](https://fakestoreapi.com/).
- Displays categories in a grid view.
- On tapping a category, fetches and displays products in that category.

### Product Details Screen
- Shows product image, title, description, and price.
- "Add to Cart" functionality.

### Cart Screen
- Displays list of added products.
- Allows quantity increment/decrement.
- Remove items from the cart.
- Displays total price and a placeholder "Checkout" button.

---

##  Technologies Used
- **Flutter**
- **Dart**
- **HTTP** package for API calls
- **Provider** or simple `setState` for state management
- **Fake Store API** for product data



## API Used

- **Base URL:** `https://fakestoreapi.com/`
- Endpoints:
  - `/products/categories` – Get product categories
  - `/products/category/{category}` – Get products by category
  - `/products/{id}` – Get product details
    
## Navigation Flow

1. **Splash Screen** → 2. **Login Screen** → 3. **Dashboard** → 4. **Product List** → 5. **Product Details** → 6. **Cart**

Navigation is handled using **named routes**.


