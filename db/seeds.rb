BookUser.destroy_all
Book.destroy_all
User.destroy_all


hp = Book.create(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", genre: "Fantasy", blurb: "It's Harry's third year at Hogwarts; not only does he have a new \n'Defense Against the Dark Arts' teacher, but there is also trouble \nbrewing. Convicted murderer Sirius Black has escaped Azkaban and \nis coming after Harry.")
percy = Book.create(title: "The Lightning Thief: Percy Jackson and the Olympians", author: "Rick Riordan", genre: "Fantasy", blurb: "The Lightning Thief. Twelve-year-old Percy Jackson is on the most \ndangerous quest of his life. With the help of a satyr and a \ndaughter of Athena, Percy must journey across the United States to catch \na thief who has stolen the original weapon of mass destruction \n— Zeus' master bolt.")
bell = Book.create(title: "The Bell Jar", author: "Sylvia Plath", genre: "Fiction", blurb: "Details the life of Esther Greenwood, a college student who \ndreams of becoming a poet. ... In addition, Esther undergoes \nelectric-shock treatment, which makes her feel as if she has \nbeen freed from a bell jar. While on a night pass, Esther loses \nher virginity, which she sees as a millstone.")
unfortunate = Book.create(title: "Series of Unfortunate Events: The Bad Beginning", author: "Lemony Snicket", genre: "Fiction", blurb: "The Bad Beginning Theme of Courage. Courage. The Cowardly Lion \nwanted it, but in The Bad Beginning, the Baudelaires actually \nhave it. Throughout their story, these little children display \namazing bravery and strength in the face of some pretty terrible \nvillainy.")
matilda = Book.create(title: "Matilda", author: "Roald Dahl", genre: "Fiction", blurb: "Matilda befriends her school teacher, Miss Honey. She soon \nrealizes Matilda's talents, but is later amazed to see the full \nextent of Matilda's powers. This is the story of a sweet bright \nlittle girl named Matilda, who is a child of wondrous \nintelligence. But unfortunately she is different from the rest \nof her family.")

arina = User.create(name: "Arina", user_name: "avictor")
danika = User.create(name: "Danika", user_name: "dbutter") 

