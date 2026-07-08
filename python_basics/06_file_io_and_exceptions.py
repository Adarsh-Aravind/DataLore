# ==========================================
# TOPIC 1: FILE INPUT/OUTPUT (I/O)
# ==========================================
# Python can read from and write to files on your computer.

print("--- File I/O ---")
file_name = "test_data.txt"

# Writing to a file (Mode 'w' - overwrites if exists, creates if not)
# 'with' statement automatically closes the file after the block finishes
with open(file_name, "w") as file:
    file.write("Hello Data Science Student!\n")
    file.write("This is line 2.\n")
print(f"Successfully wrote to {file_name}")

# Appending to a file (Mode 'a' - adds to the end)
with open(file_name, "a") as file:
    file.write("This line was appended.\n")

# Reading from a file (Mode 'r' - default mode)
print("\nReading file contents:")
with open(file_name, "r") as file:
    content = file.read()
    print(content)

# ==========================================
# TOPIC 2: ERROR HANDLING (EXCEPTIONS)
# ==========================================
# Exceptions are errors that happen during execution.
# We use try-except blocks to handle them gracefully without crashing the program.

print("--- Error Handling ---")

# Example 1: Division by Zero
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error: You cannot divide a number by zero!")

# Example 2: Handling different types of errors
try:
    number = int("Not a number") # This will cause a ValueError
except ValueError:
    print("Error: Could not convert the text to an integer.")
except Exception as e:
    # A generic catch-all for any other error
    print(f"An unexpected error occurred: {e}")
finally:
    # The 'finally' block runs no matter what (whether error happened or not)
    # Often used for cleanup tasks
    print("This 'finally' block always executes.")
