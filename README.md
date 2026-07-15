# Trading Platform Web App

A Spring Boot + JSP web application for basic stock trading simulation. Users can register/login, browse stocks, place buy/sell orders, manage wallet balance, and review trading history.

## What the app does

- Authenticates users with email/password
- Displays available stocks
- Shows stock detail pages and order entry forms
- Creates buy/sell orders in an order book
- Updates customer balance after each eligible trade
- Tracks trades in a trading history table
- Shows customer portfolio and grouped order data

## Tech stack

- **Language:** Java 17
- **Framework:** Spring Boot 2.7.3
- **Web:** Spring MVC + JSP + JSTL
- **Persistence:** Spring Data JPA (Hibernate)
- **Database:** MySQL (`trading` schema)
- **Build tool:** Maven Wrapper (`mvnw`)

## Project structure and responsibility map

```text
src/main/java/com/ab
├── OrderBookTradingApplication.java      # Spring Boot entrypoint
├── controllers/                          # HTTP routes + page navigation
├── models/                               # JPA entities (Customer, Stock, OrderBook, TradingHistory)
├── repositories/                         # Database access layer (JpaRepository + custom queries)
└── servicies/                            # Business logic layer (services + implementations)

src/main/resources
└── application.properties                # DB, JPA and JSP view resolver config

src/main/webapp/WEB-INF/views             # JSP pages rendered by controllers
```

## Detailed code walkthrough (what each part does)

### 1) Application bootstrap

- **`OrderBookTradingApplication`** starts the Spring Boot application context.

### 2) Models (`com.ab.models`)

- **`Customer`**: user account data (`customerId`, name, email, password, `balance`).
- **`Stock`**: stock catalog data (`stockId`, name, region, quantity, price).
- **`OrderBook`**: order records (buy/sell type, quantity, price, stock info, customer id, timestamp).
- **`TradingHistory`**: persisted trade events per customer and stock.

These entities are mapped with `@Entity` and persisted by JPA.

### 3) Repositories (`com.ab.repositories`)

- **`CustomerRepository`**
  - Login lookup by email/password (`findByRecord`)
  - Balance update query (`modifyCustomerBalance`)
- **`StockRepository`**
  - Standard CRUD/listing via `JpaRepository`
- **`OrderBookRepository`**
  - Standard order CRUD
  - Custom native query `showOrderBookCustomerId` to aggregate customer orders by stock
- **`TradingHistoryRepository`**
  - Filter trading history by customer id

### 4) Services (`com.ab.servicies`)

Service interfaces define capabilities, and `*Impl` classes perform repository operations.

- **Customer service**: register user, login user, update balance
- **Stock service**: list stocks and fetch stock by id
- **Order book service**: create orders, list/sort orders, portfolio lookup by customer
- **Trading history service**: create trade records, filter/sort trading history

### 5) Controllers (`com.ab.controllers`)

Controllers connect routes to services and return JSP views.

- **`CustomerMappingController`**
  - `/login` (GET/POST), `/logout`
  - `/register` + `/registerCustomer`
  - Stores logged-in user in session attribute: `session_customer`
- **`StockController`**
  - `/stocks`: show stock list
  - `/stocks/chart/{...}`: show selected stock chart/details page
- **`StockMappingController`**
  - `/stocks/chart`: direct chart page mapping
- **`OrderBookMappingController`**
  - `/stocks/orderbook` (POST): place order, create trading history row, update balance rules
  - `/stocks/orderbook` (GET): list order book
  - `/stocks/orderbook/orderByPrice` and `/stocks/orderbook/orderByQuantity`: sorted views
- **`OrderBookController`**
  - `/portfolio`: show customer portfolio (aggregated customer orders)
- **`PortfolioController`**
  - `/Sell/{stockId}/{stockRegion}/{stockName}`: sell page preparation
- **`BalanceController`**
  - `/balance`: wallet page
  - `/depositBalance` and `/withdrawBalance`: modify wallet and return portfolio view
- **`TradingHistoryController`**
  - `/stocks/tradinghistory`: customer-specific trade history view

### 6) Views (`src/main/webapp/WEB-INF/views`)

- **`login.jsp`**: login form
- **`register.jsp`**: registration form
- **`stock_list.jsp`**: stock catalog table
- **`stock_chart.jsp`**: selected stock display + order interaction
- **`order_book.jsp`**: order book list and sorting access
- **`portfolio.jsp`**: customer holdings/order summary
- **`balance.jsp`**: wallet balance, deposit, withdraw actions
- **`trading_history.jsp`**: customer trade records
- **`sell.jsp`**: sell flow page for selected stock
- **`noUser.jsp`**: fallback page when session/login is missing or invalid

(Additional JSPs like `showOrderBook.jsp`, `order_history.jsp`, and `register_success.jsp` exist as helper/legacy-style pages.)

## Configuration

`src/main/resources/application.properties` configures:

- MySQL datasource URL: `jdbc:mysql://localhost/trading`
- Username: `root`
- Hibernate auto update: `spring.jpa.hibernate.ddl-auto=update`
- JSP resolver:
  - prefix: `/WEB-INF/views/`
  - suffix: `.jsp`

## How order + balance flow works

When a user submits an order (`POST /stocks/orderbook`):

1. Current session user is loaded.
2. Timestamp string is generated.
3. If user has enough funds (`balance > price * quantity`), order is saved and trade history is saved.
4. Balance update rules:
   - `sell` -> balance increases by `price * quantity`
   - `buy` -> balance decreases by `price * quantity` (only when funds check passes)
5. Updated customer object is written back into session.

## Getting started locally

### Prerequisites

- Java 17
- MySQL running locally
- A `trading` database created in MySQL

### Steps

1. Configure DB credentials in:
   - `/home/runner/work/Trading_platform_web_app/Trading_platform_web_app/src/main/resources/application.properties`
2. Start the app:

```bash
cd /home/runner/work/Trading_platform_web_app/Trading_platform_web_app
bash mvnw spring-boot:run
```

3. Open the app in browser:
   - `http://localhost:8080/stocks`

### Build and test

```bash
cd /home/runner/work/Trading_platform_web_app/Trading_platform_web_app
bash mvnw test
bash mvnw -DskipTests package
```

## Notes

- Session state is central to navigation (`session_customer`, `session_stock`).
- Some classes/pages look like early/legacy scaffolding and are currently unused or partially used.
- The package name `servicies` is intentionally kept as-is to match the current codebase.
