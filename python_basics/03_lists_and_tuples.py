# ==========================================
# TOPIC 1: LISTS
# ==========================================
# A List is an ordered, mutable (changeable) collection of items.
# Lists are created using square brackets [].

print("--- Lists ---")
fruits = ["apple", "banana", "cherry"]
print("Original List:", fruits)

# Accessing elements (Index starts at 0)
print("First fruit:", fruits[0])
print("Last fruit (using negative index):", fruits[-1])

# Modifying elements
fruits[1] = "blueberry"
print("List after modification:", fruits)

# Adding elements
fruits.append("orange")         # Adds to the end
fruits.insert(1, "mango")       # Adds at specific index
print("List after additions:", fruits)

# Removing elements
fruits.remove("apple")          # Removes specific item
popped_fruit = fruits.pop()     # Removes and returns the last item
print("Removed by pop():", popped_fruit)
print("List after removals:", fruits)

# Slicing (getting a sub-list)
# syntax: list[start:end] (end is exclusive)
numbers = [0, 1, 2, 3, 4, 5]
print("Sliced list [2:5]:", numbers[2:5])

# ==========================================
# TOPIC 2: TUPLES
# ==========================================
# A Tuple is an ordered, IMMUTABLE (unchangeable) collection of items.
# Tuples are created using parentheses (). Use them for data that shouldn't change.

print("\n--- Tuples ---")
coordinates = (10, 20)
print("Tuple:", coordinates)

# Accessing elements works same as lists
print("X coordinate:", coordinates[0])

# Trying to modify a tuple will result in an error:
# coordinates[0] = 15  # THIS WOULD CAUSE A TypeError!

# Unpacking a tuple into variables
x, y = coordinates
print(f"Unpacked -> X: {x}, Y: {y}")

# Tuples can also contain mixed data types
mixed_tuple = (1, "Hello", True)
print("Mixed tuple length:", len(mixed_tuple))
