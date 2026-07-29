// MongoDB Basic Practice

// 1. Switch to the library database (Type this in your MongoDB shell)
use library

// 2. Insert a book into the 'books' collection
db.books.insertOne({ 
    title: "Harry Potter", 
    author: "J.K. Rowling" 
})

// 3. Look at the book you just added
db.books.find()

// ---------------------------------------------------
// EXTRA: Here are a few more commands to try!

// Add multiple books at once
db.books.insertMany([
    { title: "The Hobbit", author: "J.R.R. Tolkien" },
    { title: "1984", author: "George Orwell" }
])

// Find a specific book by title
db.books.find({ title: "1984" })

// Update the author of a book
db.books.updateOne(
    { title: "Harry Potter" },
    { $set: { author: "Joanne Kathleen Rowling" } }
)

// Delete a book
db.books.deleteOne({ title: "The Hobbit" })
