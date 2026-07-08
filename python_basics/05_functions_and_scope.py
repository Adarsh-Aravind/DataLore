# ==========================================
# TOPIC 1: FUNCTIONS
# ==========================================
# A Function is a block of reusable code that performs a specific task.
# Use the 'def' keyword to define a function.

print("--- Functions ---")

# A simple function with no parameters
def greet():
    print("Hello! Welcome to Python.")

# Calling the function
greet()

# A function with parameters (inputs) and a return value (output)
def add_numbers(num1, num2):
    """This is a docstring: it documents what the function does."""
    total = num1 + num2
    return total

# Calling and storing the result
result = add_numbers(10, 15)
print(f"The sum is: {result}")

# Functions with default parameter values
def introduce(name, role="Student"):
    print(f"My name is {name} and I am a {role}.")

introduce("Alice")                # Uses default role
introduce("David", "Teacher")     # Overrides default role

# ==========================================
# TOPIC 2: VARIABLE SCOPE
# ==========================================
# Scope determines where a variable can be accessed.
# Global variables are defined outside any function.
# Local variables are defined inside a function.

print("\n--- Variable Scope ---")

global_var = "I am global"

def check_scope():
    local_var = "I am local"
    print(global_var)   # Can access global variable inside
    print(local_var)    # Can access local variable inside

check_scope()

# print(local_var) # THIS WOULD CAUSE AN ERROR! Local variables don't exist outside their function.

# Modifying a global variable inside a function requires the 'global' keyword
counter = 0

def increment_counter():
    global counter
    counter += 1
    print("Counter is now:", counter)

increment_counter()
increment_counter()
