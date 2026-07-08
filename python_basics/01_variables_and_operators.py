# ==========================================
# TOPIC 1: VARIABLES & DATA TYPES
# ==========================================
# Variables are used to store data in memory. You don't need to declare their type explicitly.

# Integer (whole numbers)
age = 25
print("Age:", age, "| Type:", type(age))

# Float (decimal numbers)
height = 5.9
print("Height:", height, "| Type:", type(height))

# String (text)
name = "Alice"
print("Name:", name, "| Type:", type(name))

# Boolean (True or False)
is_student = True
print("Is Student:", is_student, "| Type:", type(is_student))

# ==========================================
# TOPIC 2: BASIC OPERATORS
# ==========================================
# Operators allow you to perform operations on variables and values.

# Arithmetic Operators
a = 10
b = 3
print("\n--- Arithmetic Operators ---")
print("Addition (a + b):", a + b)
print("Subtraction (a - b):", a - b)
print("Multiplication (a * b):", a * b)
print("Division (a / b):", a / b)          # Returns a float
print("Floor Division (a // b):", a // b)  # Returns integer part of division
print("Modulus (a % b):", a % b)           # Returns the remainder
print("Exponentiation (a ** b):", a ** b)  # a to the power of b

# Comparison Operators (Return True or False)
print("\n--- Comparison Operators ---")
print("Is a equal to b? (a == b):", a == b)
print("Is a not equal to b? (a != b):", a != b)
print("Is a greater than b? (a > b):", a > b)

# Logical Operators (and, or, not)
print("\n--- Logical Operators ---")
print("True and False:", True and False)
print("True or False:", True or False)
print("not True:", not True)
