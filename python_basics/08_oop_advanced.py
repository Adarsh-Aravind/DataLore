# ==========================================
# TOPIC 1: INHERITANCE
# ==========================================
# Inheritance allows a new class (Child) to inherit attributes and methods 
# from an existing class (Parent). This promotes code reuse.

print("--- Inheritance ---")

# Parent Class
class Animal:
    def __init__(self, name):
        self.name = name

    def eat(self):
        print(f"{self.name} is eating.")

    def make_sound(self):
        print("Some generic animal sound...")

# Child Class inheriting from Animal
class Cat(Animal):
    def __init__(self, name, color):
        # super() calls the constructor of the Parent class
        super().__init__(name) 
        self.color = color

    # Method Overriding: Replacing the parent's method with a custom one
    def make_sound(self):
        print(f"{self.name} says: Meow!")

# Creating a Cat object
my_cat = Cat("Whiskers", "Black")

# It can use methods from the Parent class
my_cat.eat()

# It uses its own overridden method
my_cat.make_sound()

# ==========================================
# TOPIC 2: ENCAPSULATION
# ==========================================
# Encapsulation restricts direct access to some of an object's components.
# In Python, we use underscores to indicate that an attribute is 'private'.

print("\n--- Encapsulation ---")

class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        # Double underscore __ makes this attribute pseudo-private
        self.__balance = balance  

    # A 'Getter' method allows safe viewing of private data
    def get_balance(self):
        return self.__balance

    # A 'Setter' method allows safe modification of private data
    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f"Deposited {amount}. New balance: {self.__balance}")
        else:
            print("Invalid deposit amount.")

account = BankAccount("John Doe", 1000)

print(f"Account Owner: {account.owner}")
print(f"Current Balance: {account.get_balance()}")

account.deposit(500)

# Attempting to access __balance directly will fail (or is highly discouraged)
# print(account.__balance) # AttributeError!
