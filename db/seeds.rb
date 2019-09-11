User.destroy_all
Trip.destroy_all
River.destroy_all
Company.destroy_all

User.create(name: "Lizzy")

ava = Company.create(name: "AVA")
l_descents = Company.create(name: "Liquid Descents")
rma = Company.create(name: "Rocky Mountain Adventures")
wanderlust = Company.create(name: "Wanderlust")
raft_masters = Company.create(name: "Raft Masters")
corners = Company.create(name: "4 Corners Whitewater")

arkansas = River.create(name: "Arkansas")
clear_creek = River.create(name: "Clear Creek")
upper_c = River.create(name: "Upper Colorado")
poudre = River.create(name: "Cache La Poudre")
n_platte = River.create(name: "North Platte")
animas = River.create(name: "Animas")
s_miguel = River.create(name: "San Miguel")



trip1 = Trip.create({
    name: "Brown's Canyon",
    location: "Buena Vista",
    river: arkansas,
    company: ava
})
trip2 = Trip.create({
    name: "Numbers and Narrows",
    location: "Buena Vista",
    river: arkansas,
    company: ava
})
trip3 = Trip.create({
    name: "Royal Gorge",
    location: "Cañon City",
    river: arkansas,
    company: ava
})
