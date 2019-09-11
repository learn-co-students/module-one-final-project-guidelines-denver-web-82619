require 'activerecord_reset_pk_sequence'

User.destroy_all
River.destroy_all
Company.destroy_all
Trip.destroy_all


User.create(name: "Lizzy")

ava = Company.create(id: 1, name: "AVA")
l_descents = Company.create(id: 2, name: "Liquid Descents")
rma = Company.create(id: 3, name: "Rocky Mountain Adventures")
wanderlust = Company.create(id: 4, name: "Wanderlust")
raft_masters = Company.create(id: 5, name: "Raft Masters")
corners = Company.create(id: 6, name: "4 Corners Whitewater")

arkansas = River.create(id: 1, name: "Arkansas")
clear_creek = River.create(id: 2, name: "Clear Creek")
upper_c = River.create(id: 3, name: "Upper Colorado")
poudre = River.create(id: 4, name: "Cache La Poudre")
n_platte = River.create(id: 5, name: "North Platte")
animas = River.create(id: 6, name: "Animas")
s_miguel = River.create(id: 7, name: "San Miguel")
