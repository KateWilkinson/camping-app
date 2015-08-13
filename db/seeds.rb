# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Site.create name: "ABC Camping", address: "123 Bay Road, Glastonbury", town: "Glastonbury", postcode: 'BA4 6TA', price: "300", description: "Suitable for families"
Site.create name: "XYZ Camping", address: "987 Yellow Road, Redcar", town: "Cambridge", postcode: 'CB4 2SY', price: "350", description: "Suitable for pets"
