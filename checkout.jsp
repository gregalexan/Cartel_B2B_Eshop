<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="cartel.*" %>

<%
	User user = null;
	if (session.getAttribute("currentuser") != null) {
		user = (User) session.getAttribute("currentuser");
	} else {
        String source = "checkout.jsp";
        session.setAttribute("source", source);
        request.setAttribute("message", "You have to log in to complete the checkout!");
    %>
        <jsp:forward page="login.jsp"/>
    <%
  }
  
  double total = (session.getAttribute("total") != null) ? (Double) session.getAttribute("total") : 0.0;
  if (total == 0.0) {
    response.sendRedirect("cart.jsp");
  }
%>

<!DOCTYPE html>
<head>
    <%@ include file="header.jsp"%>
    <title>Checkout - Cartel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMX7FQ3rB4TyJbmeWX6P7dk9Qf6Z5kx5kk7F8P5" crossorigin="anonymous">
</head>
<body>
    
    <%@ include file="navbar.jsp"%>
    <!-- Checkout -->
     <div class="checkout">
        <h1><span style="color: #3b8e72;">Cartel</span> Checkout</h1>
        <div class="row">
            <div class="col-75">
                <div class="col-50">
                    <div class="container">
                      <h2>Your Total <span class="price" style="color:black"><b>$<%= total%></b></span></h2>
                    </div>
                  </div>
              <div class="container">
                <form action="checkoutController.jsp" method="post">
                  <div class="row">
                    <div class="col-50">
                      <h3>Billing Address</h3>
                      <!-- Company Name -->
                      <label for="companyName"><i class="fas fa-briefcase"></i> Company Name</label>
                      <input type="text" id="companyName" name="companyName" placeholder="<%=user.getName()%>" value="<%=user.getName()%>" required>
                      <!-- Company SSN -->
                      <label for="companySSN"><i class="fas fa-id-card"></i> Company SSN</label>
                      <input type="text" id="companySSN" name="companySSN" placeholder="<%=user.getSSN()%>" value="<%=user.getSSN()%>" required>
                      <!-- Email -->
                      <label for="email"><i class="fa fa-envelope"></i> Email</label>
                      <input type="text" id="email" name="email" placeholder="<%=user.getEmail()%>" value="<%=user.getEmail()%>" required>
                      <!-- Address -->
                      <label for="adr"><i class="fas fa-map-marker-alt"></i> Address</label>
                      <input type="text" id="adr" name="address" placeholder="<%= user.getAddress() != null ? user.getAddress() : "Address"%>" value="<%= user.getAddress() != null ? user.getAddress() : ""%>" required>
                      <label for="phone"><i class="fa fa-phone"></i> Phone</label>
                      <input type="text" id="phone" name="phone" placeholder="<%= user.getPhone() !=null ? user.getPhone() : "Phone"%>" value="<%= user.getPhone() !=null ? user.getPhone() : ""%>" required> 
                      
                      <div class="row">
                        <div class="col-50">
                          <label for="city"><i class="fas fa-city"></i> City</label>
                          <input type="text" id="city" name="city" placeholder="<%= user.getCity() != null ? user.getCity() : "City" %>" value="<%= user.getCity() != null ? user.getCity() : "" %>" required>
                        </div>
                        <div class="col-50">
                          <label for="zip"><i class="fas fa-mail-bulk"></i> Zip</label>
                          <input type="text" id="zip" name="zip" placeholder="<%= user.getZip() != 0 ? user.getZip() : "Zip"%>" value="<%= user.getZip() != 0 ? user.getZip() : ""%>" required>
                        </div>
                      </div>
                    </div>
                    <div class="col-50">
                      <h3>Payment</h3>
                      <div class="icon-container">
                        <label class="checkout-cards" for="fname">Accepted Cards</label>
                        <i class="fab fa-cc-visa" style="color:navy;"></i>
                        <i class="fab fa-cc-amex" style="color:blue;"></i>
                        <i class="fab fa-cc-mastercard" style="color:red;"></i>
                        <i class="fab fa-paypal" style="color:rgb(84, 84, 195);"></i>
                      </div>
                      <div class="checkout-card-details">
                        <div style="text-align:center;">
                          <h4 style="margin: 10px; color: var(--primary-color);">Do not change credit card information!</h4>
                        </div>
                        <label for="cname">Name on Card</label>
                        <input type="text" id="cname" name="cardname" placeholder="John More Doe" value="<%=user.getName()%>" required>
                        <label for="ccnum">Credit card number</label>
                        <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" value="1111-2222-3333-4444" required>
                        <div class="row">
                          <div class="col-50">
                            <label for="exp-date">Exp Date (MM/YY)</label>
                            <input type="text" id="exp-date" name="exp-date" placeholder="MM/YY" value="12/30" maxlength="5" required>
                          </div>
                          <div class="col-50">
                            <label for="cvv">CVV</label>
                            <input type="numeric" id="cvv" name="cvv" placeholder="352" value="352" required>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <label class="checkbox-inline">
                      <input type="checkbox" id="saveInfo" value="on" name="saveInfo">Save my&nbsp;<span style="color:var(--primary-color);">Address</span>&nbsp;Info
                  </label>
                  <input type="submit" value="Confirm Payment" class="btnCart">
                </form>
              </div>
            </div>
          </div>
     </div>
    <!-- End Checkout -->
    
    <%@ include file="footer.jsp"%>
    
    <script>
      document.getElementById('exp-date').addEventListener('input', function (e) {
          // Get the current value of the input
          let value = e.target.value.replace(/\D/g, ''); // Remove non-digit characters
          // Insert the slash after the first two digits
          if (value.length > 2) {
              value = value.slice(0, 2) + '/' + value.slice(2, 4);
          }
          // Update the input value
          e.target.value = value;
      });
  </script>
  <script>
    document.getElementById('ccnum').addEventListener('input', function (e) {
        // Get the current value of the input
        let value = e.target.value.replace(/\D/g, ''); // Remove all non-digit characters

        // Limit the input to a maximum of 16 digits
        value = value.substring(0, 16);

        // Format the value with dashes every four digits
        let formattedValue = value.match(/.{1,4}/g)?.join('-') || '';

        // Update the input field with the formatted value
        e.target.value = formattedValue;
    });

    document.getElementById('ccnum').addEventListener('keydown', function (e) {
        // Prevent typing if the length of the formatted value exceeds 19 characters
        let value = e.target.value;
        if (value.length >= 19 && e.key !== 'Backspace' && e.key !== 'Delete') {
            e.preventDefault();
        }
    });
</script>


</body>
</html>