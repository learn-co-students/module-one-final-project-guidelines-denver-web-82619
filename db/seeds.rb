# BookUsers.destroy_all
Book.destroy_all
User.destroy_all

hp = Book.create(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", genre: "Fantasy", blurb: "Blurb.")
percy = Book.create(title: "Percy Jackson", author: "Rick Riordan", genre: "Fantasy", blurb: "An interesting book.")
bell = Book.create(title: "The Bell Jar", author: "Sylvia Plath", genre: "Fiction", blurb: "The best ever.")
unfortunate = Book.create(title: "Series of Unfortunate Events", author: "Lemony Snicket", genre: "Fiction", blurb: "Magical.")
matilda = Book.create(title: "Matilda", author: "Roald Dahl", genre: "Fiction", blurb: "About a young girl.")


