void main() {
  // Initial list of item prices
  List<double> cart = [5.0, 12.5, 8.0, 20.0, 15.0];

  print("Original Cart: $cart");

  // 1. Anonymous Function (Filter out items under $10)
  List<double> filteredCart = cart.where((price) => price >= 10).toList();
  print("Filtered Cart (Items >= \$10): $filteredCart");

  // 2. Higher-Order Function: applyDiscount
   List<double> discountedCart = applyDiscount(
    filteredCart,
    (price) => price * 0.9, // 10% discount
  );

  print("Cart After 10% Discount: $discountedCart");

  
  // 3. Standard Function: calculateTotal (with optional tax)
  double totalBeforeTax = calculateTotal(discountedCart);
  print("Total Before Tax: \$${totalBeforeTax.toStringAsFixed(2)}");
  double totalAfterTax = calculateTotal(discountedCart, taxRate: 0.05); // 5% tax
  print("Total After 5% Tax: \$${totalAfterTax.toStringAsFixed(2)}");

  
  // 4. Recursive Function: Factorial Discount
   int itemCount = discountedCart.length;
  int factorialDiscount = calculateFactorialDiscount(itemCount); // n!
  print("Factorial Discount (${itemCount}!): $factorialDiscount%");

  // Apply factorial discount
  double finalPrice =
      totalAfterTax - (totalAfterTax * (factorialDiscount / 100));
      print("Final Price After Applying Factorial Discount: "
      "\$${finalPrice.toStringAsFixed(2)}");
}


// Standard Function: calculateTotal with optional tax
  double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double sum = prices.fold(0, (total, price) => total + price);
  return sum + (sum * taxRate);
}


// Higher-Order Function: takes a discount function
List<double> applyDiscount(
    List<double> prices, double Function(double) discountFunction) {
  return prices.map((price) => discountFunction(price)).toList();
}


// Recursive Function: calculates factorial-based discount
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}
