# ==========================================
# TOPIC 1: DICTIONARIES
# ==========================================
# A Dictionary is an unordered collection of Key-Value pairs.
# Keys must be unique and immutable (like strings or numbers).
# Dictionaries are created using curly braces {} with key: value pairs.

print("--- Dictionaries ---")
student = {
    "name": "Bob",
    "age": 22,
    "course": "Data Science"
}
print("Original Dictionary:", student)

# Accessing values using keys
print("Student's name:", student["name"])

# A safer way to access (returns None instead of an Error if key doesn't exist)
print("Student's grade:", student.get("grade", "Not Found"))

# Adding or Updating values
student["grade"] = "A"          # Adds a new key-value pair
student["age"] = 23             # Updates an existing value
print("Dictionary after updates:", student)

# Removing key-value pairs
del student["course"]
print("Dictionary after deletion:", student)

# Iterating through a dictionary
print("\nIterating:")
for key, value in student.items():
    print(f"{key}: {value}")

# ==========================================
# TOPIC 2: SETS
# ==========================================
# A Set is an unordered collection of UNIQUE elements.
# Sets are created using curly braces {}, but without key-value pairs.

print("\n--- Sets ---")
# Duplicates are automatically removed
colors = {"red", "green", "blue", "red", "green"}
print("Set (duplicates removed):", colors)

# Adding and removing elements
colors.add("yellow")
colors.remove("blue")
print("Set after add/remove:", colors)

# Set Operations (Math-like operations)
set_A = {1, 2, 3, 4}
set_B = {3, 4, 5, 6}

print("\nSet Operations:")
print("Union (All unique elements from both):", set_A.union(set_B))
print("Intersection (Elements common to both):", set_A.intersection(set_B))
print("Difference (Elements in A but not in B):", set_A.difference(set_B))
