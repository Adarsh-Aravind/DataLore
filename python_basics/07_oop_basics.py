# ==========================================
# TOPIC 1: CLASSES AND OBJECTS
# ==========================================
# Object-Oriented Programming (OOP) groups data and behavior together.
# A Class is a blueprint. An Object is an instance of that blueprint.

print("--- Classes and Objects ---")

# Defining a class
class Dog:
    pass # 'pass' means do nothing. It's an empty class.

# Creating objects (instances) from the class
dog1 = Dog()
dog2 = Dog()
print(f"dog1 is a: {type(dog1)}")


# ==========================================
# TOPIC 2: CONSTRUCTORS (__init__) & METHODS
# ==========================================
# The __init__ method initializes the object's attributes when it's created.
# Methods are functions that belong to an object.

print("\n--- Constructors and Methods ---")

class Student:
    # Constructor: called automatically when a new object is created
    # 'self' refers to the specific object being created/accessed
    def __init__(self, name, age, major):
        self.name = name    # These are 'Attributes' (data)
        self.age = age
        self.major = major
        
    # An Instance Method (behavior)
    def introduce(self):
        print(f"Hi, I'm {self.name}, {self.age} years old, studying {self.major}.")

    def celebrate_birthday(self):
        self.age += 1
        print(f"Happy Birthday {self.name}! You are now {self.age}.")

# Creating Student objects with specific data
student1 = Student("Alice", 20, "Data Science")
student2 = Student("Bob", 22, "Computer Science")

# Accessing attributes directly
print(f"Student 1's name is: {student1.name}")

# Calling methods on the objects
student1.introduce()
student2.introduce()

print("\nCelebrating birthday for Alice:")
student1.celebrate_birthday()
