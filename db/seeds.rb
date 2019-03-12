# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# create users
User.create(id: 2339819486042459, username: "Sebastian")
User.create(id: 10215006507129048, username: "John")

# create customer
Customer.create(name: "General Purpose AI Company", password: "test")

# create first dataset, its images and its dataset classes
Dataset.create(name: "Animals", folder_path: "/", description: "Includes various types of animals", goal: 20.0, customer_id: 1)

DatasetClass.create(name:"Domestic rabbit", description: "Domestic rabbit", dataset: Dataset.first)
DatasetClass.create(name:"Rabbit", description: "Rabbit", dataset: Dataset.first)
DatasetClass.create(name:"Vertebrate", description: "Vertebrate", dataset: Dataset.first)
DatasetClass.create(name:"Rabbits and Hares", description: "Rabbits and Hares", dataset: Dataset.first)
DatasetClass.create(name:"Mountain Cottontail", description: "Mountain Cottontail", dataset: Dataset.first)
DatasetClass.create(name:"Grass", description: "Grass", dataset: Dataset.first)
Image.create(file_path: "https://ichef.bbci.co.uk/images/ic/976x549/p04f5x5v.jpg", dataset: Dataset.first)


DatasetClass.create(name:"Mammal", description: "Mammal", dataset: Dataset.first)
DatasetClass.create(name:"Lion", description: "Lion", dataset: Dataset.first)
DatasetClass.create(name:"Vertebrate", description: "Vertebrate", dataset: Dataset.first)
DatasetClass.create(name:"Wildlife", description: "Wildlife", dataset: Dataset.first)
DatasetClass.create(name:"Masai lion", description: "Masai lion", dataset: Dataset.first)
DatasetClass.create(name:"Big cats", description: "Big cats", dataset: Dataset.first)
Image.create(file_path: "https://cosmos-images2.imgix.net/file/spina/photo/14772/GettyImages-691120979.jpg?ixlib=rails-2.1.4&auto=format&ch=Width%2CDPR&fit=max&w=835", dataset: Dataset.first)

DatasetClass.create(name:"Rodent", description: "Rodent", dataset: Dataset.first)
DatasetClass.create(name:"Recreation", description: "Recreation", dataset: Dataset.first)
DatasetClass.create(name:"Wildlife", description: "Wildlife", dataset: Dataset.first)
DatasetClass.create(name:"Whiskers", description: "Whiskers", dataset: Dataset.first)
Image.create(file_path: "https://r.hswstatic.com/w_907/gif/nonhuman-animals-jobs-1.jpg", dataset: Dataset.first)

DatasetClass.create(name:"Zebra", description: "Zebra", dataset: Dataset.first)
DatasetClass.create(name:"Vertebrate", description: "Vertebrate", dataset: Dataset.first)
DatasetClass.create(name:"Terrestrial animal", description: "Terrestrial animal", dataset: Dataset.first)
DatasetClass.create(name:"Wildlife", description: "Wildlife", dataset: Dataset.first)
DatasetClass.create(name:"Mammal", description: "Mammal", dataset: Dataset.first)
Image.create(file_path: "https://i.ytimg.com/vi/8CqxwsHCZ1o/maxresdefault.jpg", dataset: Dataset.first)

DatasetClass.create(name:"Dog", description: "Dog", dataset: Dataset.first)
DatasetClass.create(name:"Mammal", description: "Mammal", dataset: Dataset.first)
DatasetClass.create(name:"Vertebrate", description: "Vertebrate", dataset: Dataset.first)
DatasetClass.create(name:"Siberian husky", description: "Siberian husky", dataset: Dataset.first)
DatasetClass.create(name:"Canidae", description: "Canidae", dataset: Dataset.first)
Image.create(file_path: "https://www.the-tls.co.uk/s3/tls-prod/uploads/2017/02/White-Fang.jpg", dataset: Dataset.first)


# create first dataset, its images and its dataset classes
Dataset.create(name: "Everyday Images", description: "Includes various types of objects", goal: 10.0, customer_id: 1)

DatasetClass.create(name:"Banana family", description: "Banana family", dataset: Dataset.second)
DatasetClass.create(name:"Natural foods", description: "Natural foods", dataset: Dataset.second)
DatasetClass.create(name:"Banana", description: "Banana", dataset: Dataset.second)
DatasetClass.create(name:"Cooking plantain", description: "Cooking plantain", dataset: Dataset.second)
DatasetClass.create(name:"Saba banana", description: "Saba banana", dataset: Dataset.second)
Image.create(file_path: "https://4.bp.blogspot.com/-rZ5gIt5TF4A/VdnbfSpdL7I/AAAAAAAACJw/2ckHDLjieMI/s1600/banana-3.jpg", dataset: Dataset.second)

DatasetClass.create(name:"Espresso machine", description: "Espresso machine", dataset: Dataset.second)
DatasetClass.create(name:"Small appliance", description: "Small appliance", dataset: Dataset.second)
DatasetClass.create(name:"Coffeemaker", description: "Coffeemaker", dataset: Dataset.second)
DatasetClass.create(name:"Drip coffee maker", description: "Drip coffee maker", dataset: Dataset.second)
DatasetClass.create(name:"Home appliance", description: "Home appliance", dataset: Dataset.second)
DatasetClass.create(name:"Cup", description: "Cup", dataset: Dataset.second)
Image.create(file_path: "https://www.lidl.de/media/product/0/2/8/7/6/2/2/bellarom-kapselmaschine-bkm-1250-a1-regular--2.jpg", dataset: Dataset.second)

DatasetClass.create(name:"Soccer ball", description: "Soccer ball", dataset: Dataset.second)
DatasetClass.create(name:"Football", description: "Football", dataset: Dataset.second)
DatasetClass.create(name:"Sports equipment", description: "Sports equipment", dataset: Dataset.second)
DatasetClass.create(name:"Ball", description: "Ball", dataset: Dataset.second)
DatasetClass.create(name: "Grass", description: "Grass", dataset: Dataset.second)
DatasetClass.create(name: "Player", description: "Player", dataset: Dataset.second)
Image.create(file_path: "https://bilder.t-online.de/b/82/86/69/48/id_82866948/610/tid_da/am-24-.jpg", dataset: Dataset.second)

DatasetClass.create(name: "Liqueur", description: "Liqueur", dataset: Dataset.second)
DatasetClass.create(name: "Flavored syrup", description: "Flavored syrup", dataset: Dataset.second)
DatasetClass.create(name: "Sauces", description: "Sauces", dataset: Dataset.second)
DatasetClass.create(name: "Drink", description: "Drink", dataset: Dataset.second)
DatasetClass.create(name: "Ingredient", description: "Ingredient", dataset: Dataset.second)
Image.create(file_path: "https://www.coopathome.ch/img/produkte/880_880/RGB/3022329_001.jpg?_=1455446992126", dataset: Dataset.second)

DatasetClass.create(name: "Land vehicle", description: "Land vehicle", dataset: Dataset.second)
DatasetClass.create(name: "Vehicle", description: "Vehicle", dataset: Dataset.second)
DatasetClass.create(name: "Formula libre", description: "Formula libre", dataset: Dataset.second)
DatasetClass.create(name: "Formula one car", description: "Formula one car", dataset: Dataset.second)
DatasetClass.create(name: "Car", description: "Car", dataset: Dataset.second)
DatasetClass.create(name: "Race car", description: "Race car", dataset: Dataset.second)
Image.create(file_path: "https://tufast-racingteam.de/Uploads/2fbab1d1a52fb6e4d04f1d8a970a363b/vFZJEZ/IMG-20180512-WA0004.jpg/SetSize/1024/455.jpg", dataset: Dataset.second)
