# Take-Home Code Challenge

Take-Home Code Challenge is an API-based application that facilitates user transactions and bulk transaction processing. It allows users to create accounts, manage transactions, and perform bulk imports efficiently. Built on Ruby on Rails, it ensures data integrity and user validation while providing a seamless user experience.

## Features

### POST /api/v1/users

**Endpoint:** /api/v1/users  
**Purpose:** To handle the creation of new user records.  
**Parameters:**
- `name`: The name of the new user provided in a JSON object under the `user` attribute.  
**Response:** Returns a JSON object indicating the status of the request (success or error) and either the `user_id` on successful creation or a message with error details on failure.

### POST /api/v1/transactions/single

**Endpoint:** /api/v1/transactions/single  
**Purpose:** To handle the creation of a single transaction record.  
**Parameters:**
- `transaction_id`: Unique identifier for the transaction. Must be present and unique.
- `points`: Integer value representing the points associated with the transaction. Must be present and an integer.
- `user_id`: Identifier of the user associated with the transaction. Must be present and refer to an existing user.
- `status`: Current status of the transaction, such as "completed". Must be present.  
**Response:** Returns a JSON object containing the status of the operation and the transaction ID of the newly created transaction. If the transaction is successfully created, the response includes the transaction ID and success status. If there are validation errors, an appropriate error message is returned.

### POST /api/v1/transactions/bulk

**Endpoint:** /api/v1/transactions/bulk  
**Purpose:** To handle the creation of multiple transaction records in bulk. This endpoint processes a list of transactions and attempts to create each one, returning a success response with the count of processed transactions or an error response with details of any validation errors encountered.  
**Parameters:**
- `transactions`: An array of transaction objects, each containing the following fields:
  - `transaction_id`: The unique identifier for the transaction.
  - `points`: The number of points associated with the transaction.
  - `user_id`: The ID of the user associated with the transaction.
  - `status`: The status of the transaction (e.g., "completed").  
**Response:** Returns a JSON object indicating the status of the bulk transaction processing. On success, the response includes the total count of processed transactions and a success message. If there are validation errors, the response includes the relevant error messages for each invalid transaction.

## Integrated CI for Automated Testing

I implemented a Continuous Integration (CI) action using GitHub Actions for automated testing of the Rails application. The CI workflow is triggered on push and pull request events to the main branch. It sets up a testing environment, including a PostgreSQL database, installs dependencies, and runs the RSpec test suite to ensure code quality and reliability.

## Technologies

The application is built using the following technologies:
- **PostgreSQL**: For the database to store users and transactions information.
- **Ruby (3.2.2)**: For the core language of the Rails framework.
- **Rails (7.1.3.4)**: Web application framework built with the Ruby programming language.

## Postman Collection

This is the Postman collection. You can test the APIs through it using the following link:  
[Postman Collection](https://api.postman.com/collections/27246092-08f059a8-6d9b-4396-8850-3835891581be?access_key=PMAT-01J1DFJXMEA9V4J67NP8J5RXHS)

## Installation

To install and run the application locally, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/rohitp20092/Take-Home-Code-Challenge.git
    ```

2. Install the dependencies for the server:
    ```sh
    cd Take-Home-Code-Challenge
    bundle install
    ```

3. Configure the PostgreSQL settings in the `database.yml` file as per your machine.

4. Create and migrate the database:
    ```sh
    bundle exec rails db:create
    bundle exec rails db:migrate
    ```

5. Run the test suite and ensure all tests pass:
    ```sh
    bundle exec rspec
    ```

6. Once the test cases are green, you can test the APIs.

## Proposed Improvement: Implement Authentication

### Problem Statement

In our current application, we do not have an authentication mechanism in place. This means that any user can access and interact with the application's resources without verification.

### Proposed Solution

To address this limitation and enhance our application's security and user management, we propose the following improvement:

1. **Integrate an Authentication System**

   Implement an authentication system using a robust and widely-used solution like Devise. This will allow us to handle user sign-up, login, and logout functionalities securely.

2. **Protect Sensitive Routes and Actions**

   Restrict access to sensitive routes and actions, ensuring that only authenticated users can perform certain operations (e.g., creating, updating, or deleting records).

3. **Implement Role-Based Access Control**

   Introduce role-based access control to differentiate between user roles (e.g., admin, regular user) and assign appropriate permissions to each role.

### Benefits and Additional Features

This improvement opens up several possibilities for extending our application's functionality:

- **Enhanced Security:** By requiring users to authenticate, we can prevent unauthorized access and protect sensitive data.
- **User Management:** We can manage user accounts, including functionalities like password resets and account verification.
- **Audit Trails:** We can track user activities and maintain logs of changes made by different users, improving accountability and traceability.
- **Personalized Experience:** Authenticated users can have personalized experiences, such as viewing their own transactions or preferences.

This proposed improvement will significantly enhance the security, usability, and overall robustness of our application. However, due to tight deadlines, I was unable to implement this feature in the current iteration.
