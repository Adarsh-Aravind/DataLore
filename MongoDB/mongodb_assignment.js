// Assuming your collection is named 'Students'

// 16. Update the city of the student named Rahul to 'Bangalore'.
db.Students.updateOne({ name: 'Rahul' }, { $set: { city: 'Bangalore' } })

// 17. Increase the marks of all students in the 'Python' course by 5.
db.Students.updateMany({ course: 'Python' }, { $inc: { marks: 5 } })

// 18. Decrease the marks of students whose marks are greater than 90 by 2.
db.Students.updateMany({ marks: { $gt: 90 } }, { $inc: { marks: -2 } })

// 19. Add 'Reading' to the hobbies array of the student named Anu.
db.Students.updateOne({ name: 'Anu' }, { $push: { hobbies: 'Reading' } })

// 20. Remove 'Cricket' from the hobbies array of the student named Rahul.
db.Students.updateOne({ name: 'Rahul' }, { $pull: { hobbies: 'Cricket' } })

// 21. Update the grade to 'A+' for students with marks greater than or equal to 90.
db.Students.updateMany({ marks: { $gte: 90 } }, { $set: { grade: 'A+' } })

// ---------------------------------------------------------
// SORTING & LIMITING

// 22. Sort all students by marks in ascending order (1 = lowest to highest).
db.Students.find().sort({ marks: 1 })

// 23. Sort all students by marks in descending order (-1 = highest to lowest).
db.Students.find().sort({ marks: -1 })

// 24. Display the top 3 students based on marks.
db.Students.find().sort({ marks: -1 }).limit(3)

// 25. Sort students first by city (ascending) and then by marks (descending).
db.Students.find().sort({ city: 1, marks: -1 })

// ---------------------------------------------------------
// AGGREGATION FRAMEWORK (Advanced Grouping & Math)

// 26. Count the number of students in each city using aggregation.
db.Students.aggregate([
  { $group: { _id: "$city", count: { $sum: 1 } } }
])

// 27. Find the average marks for each course.
db.Students.aggregate([
  { $group: { _id: "$course", avgMarks: { $avg: "$marks" } } }
])

// 28. Find the highest marks in each course.
db.Students.aggregate([
  { $group: { _id: "$course", highestMarks: { $max: "$marks" } } }
])

// 29. Find the lowest marks in each course.
db.Students.aggregate([
  { $group: { _id: "$course", lowestMarks: { $min: "$marks" } } }
])

// 30. Count the number of students in each grade.
db.Students.aggregate([
  { $group: { _id: "$grade", studentCount: { $sum: 1 } } }
])

// 31. Find the total marks scored by students in each city.
db.Students.aggregate([
  { $group: { _id: "$city", totalMarks: { $sum: "$marks" } } }
])

// 32. Find the average age of students in each city.
db.Students.aggregate([
  { $group: { _id: "$city", avgAge: { $avg: "$age" } } }
])

// 33. Display only groups where the average marks are greater than 75. 
// (Assuming we are grouping by course for this example)
db.Students.aggregate([
  { $group: { _id: "$course", avgMarks: { $avg: "$marks" } } },
  { $match: { avgMarks: { $gt: 75 } } }
])

// 34. Count the number of students whose marks are less than 70 in each course.
// Notice how we $match (filter) FIRST before we $group!
db.Students.aggregate([
  { $match: { marks: { $lt: 70 } } },
  { $group: { _id: "$course", count: { $sum: 1 } } }
])

// 35. Group students by course and display the maximum, minimum, and average marks.
db.Students.aggregate([
  { $group: { 
      _id: "$course", 
      maxMarks: { $max: "$marks" },
      minMarks: { $min: "$marks" },
      avgMarks: { $avg: "$marks" }
  }}
])
