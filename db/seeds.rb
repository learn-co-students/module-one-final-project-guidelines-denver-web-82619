River.destroy_all
Company.destroy_all
Trip.destroy_all


ava = Company.create(name: "AVA")
arkansas = River.create(name: "Arkansas")

trip1 = Trip.create({
    name: "Brown's Canyon",
    location: "Buena Vista",
    river: arkansas,
    company: ava
})
