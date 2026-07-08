# ==========================================
# TOPIC 1: CONTROL FLOW (IF / ELIF / ELSE)
# ==========================================
# Control flow allows your code to make decisions based on conditions.

temperature = 30

print("--- Control Flow ---")
if temperature > 35:
    print("It's very hot outside! Stay hydrated.")
elif temperature > 25:
    print("It's a warm day.")
else:
    print("It's cool outside.")

# You can also use logical operators in conditions
is_raining = True
if temperature < 20 and is_raining:
    print("Don't forget your jacket and umbrella!")

# ==========================================
# TOPIC 2: LOOPS (FOR & WHILE)
# ==========================================
# Loops allow you to execute a block of code multiple times.

print("\n--- For Loop ---")
# The 'for' loop iterates over a sequence (like a range of numbers, or items in a list)
# range(5) generates numbers from 0 to 4
for i in range(5):
    print("For loop iteration:", i)

print("\n--- While Loop ---")
# The 'while' loop keeps executing as long as a condition is True
counter = 0
while counter < 3:
    print("While loop counter:", counter)
    counter += 1  # Important: increase counter to avoid an infinite loop!

print("\n--- Loop Control Statements ---")
# 'break' stops the loop entirely
# 'continue' skips the rest of the current iteration and moves to the next one
for num in range(1, 6):
    if num == 3:
        print("Skipping number 3 using 'continue'")
        continue
    if num == 5:
        print("Stopping loop at 5 using 'break'")
        break
    print("Current number:", num)
