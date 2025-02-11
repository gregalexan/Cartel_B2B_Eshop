# Cartel 🛒 🛍️ 💳 

## Table of Contents
- [Overview :open_book:](#overview-open_book)
- [Take a Look :mag_right:](#take-a-look-mag_right)
- [Features :sparkles:](#features-sparkles)
- [Project Structure :card_index_dividers:](#project-structure-card_index_dividers)
- [Setup and Installation :desktop_computer:](#setup-and-installation-desktop_computer)
- [Prerequisites :clipboard:](#prerequisites-clipboard)
- [Installing & Running :gear:](#installing--running-gear)
- [License :balance_scale:](#license-balance_scale)
  
## Overview :open_book:
*Cartel* is a versatile B2B platform designed for everyone! This web application is built using Jakarta Server Pages (JSP), previously known as Java Server Pages, and follows a robust 3-tier architecture:  
  
  **1) Presentation Layer:** Implemented with JSP.  
    
  **2) Application Layer:** Developed using Java.  
    
  **3) Data Layer:** Powered by a MySQL database.  
    
The platform offers a wide range of features and functionalities, which will be detailed further using our use case diagram. Some of the core capabilities include browsing products from other companies, purchasing them, and selling your own products to other businesses.
  
## Take a Look :mag_right:
**You can check the project live [here](http://ism.dmst.aueb.gr/ismgroup58)**  

### Home Page :house: 
![Cartel Home Page](https://github.com/gregalexan/Cartel_B2B_Eshop/blob/main/images/homepage.png)  

## Features :sparkles:
### Use Case Diagram:  
![Cartel Use Case Diagram](https://github.com/gregalexan/Cartel_B2B_Eshop/blob/main/images/useCaseDiagram.png)
### Component Diagram:   
![Cartel Component Diagram](https://github.com/gregalexan/Cartel_B2B_Eshop/blob/main/images/componentDiagram.png)

    
## Project Structure :card_index_dividers:  
<pre>
 .
 ├── LICENSE
 ├── README.md
 ├── build
 |   └── cartel
 |      ├── DButil.class
 |      ├── Order.class
 |      ├── OrderComparator.class
 |      ├── OrderService.class
 |      ├── Product.class
 |      ├── ProductService.class
 |      ├── Review.class
 |      ├── ReviewService.class
 |      ├── User.class
 |      └── UserService.class
 ├── cartel
 |   ├── DButil.java
 |   ├── Order.java
 |   ├── OrderService.java
 |   ├── Product.java
 |   ├── ProductService.java
 |   ├── Review.java
 |   ├── ReviewService.java
 |   ├── User.java
 |   └── UserService.java
 ├── css
 |   └── style.css
 ├── images
 ├── js
 |   ├── dropdowns.js
 |   └── main.js
 ├── about.jsp
 ├── addProductController.jsp
 ├── addProductForm.jsp
 ├── addToCartController.jsp
 ├── browse-products.jsp
 ├── cart.jsp
 ├── checkout.jsp
 ├── checkoutController.jsp
 ├── deleteProductController.jsp
 ├── editProduct.jsp
 ├── editProductController.jsp
 ├── editProfileController.jsp
 ├── error.jsp
 ├── footer.jsp
 ├── full-orders-history.jsp
 ├── full-transaction-history.jsp
 ├── header.jsp
 ├── login.jsp
 ├── loginController.jsp
 ├── logout.jsp
 ├── my-products.jsp
 ├── navbar.jsp
 ├── product-details.jsp
 ├── product-reviews.jsp
 ├── profile.jsp 
 ├── registerController.jsp
 ├── removeFromCart.jsp
 ├── review.jsp
 ├── reviewController.jsp
 └── web.xml
</pre>
  
  
## Setup and Installation :desktop_computer:

### Prerequisites :clipboard:
- **Java JDK**
- **Apache Tomcat**
- **MySQL**

### Installing & Running :gear:
1) Clone the repository
```
git clone git@github.com:gregalexan/cartel.git
```
2) Create the database using the files
```
Data.sql
database.sql
```
4) Update the with your database credentials
```
DBUtil.java
```
6) Copy the folder and upload it on Tomcat inside
```
webapps
```
8) Run Tomcat
9) The web application is now running on http://localhost:8080

## License :balance_scale:
The project is licensed under the terms of ***Apache License version 2.0***
