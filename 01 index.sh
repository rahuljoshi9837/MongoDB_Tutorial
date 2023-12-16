#### Insert one document ####
db.inventory.insertOne({item: 'canvas',qty: 100,tags: ['cotton'],size: { h: 28, w: 35.5, uom: 'cm' }});

#### Retrieve the document ####
db.inventory.find({item: 'canvas'});

#### Insert multiple documents ####
db.inventory.insertMany([
   { item: "journal", qty: 25, tags: ["blank", "red"], size: { h: 14, w: 21, uom: "cm" } },
   { item: "mat", qty: 85, tags: ["gray"], size: { h: 27.9, w: 35.5, uom: "cm" } },
   { item: "mousepad", qty: 25, tags: ["gel", "blue"], size: { h: 19, w: 22.85, uom: "cm" } }
]);

db.inventory.insertMany([
   { name: "Rahul", age: 24 },
   { name: "joshi", age: 24 }
]);

db.inventory.insertMany(
    [
        { item: "journal", qty: 25, size: { "h": 14, "w": 21, "uom": "cm" }, "status": "A" },
        { item: "notebook", qty: 50, size: { "h": 8.5, "w": 11, "uom": "in" }, "status": "A" },
        { item: "paper", qty: 100, size: { "h": 8.5, "w": 11, "uom": "in" }, "status": "D" },
        { item: "planner", qty: 75, size: { "h": 22.85, "w": 30, "uom": "cm" }, "status": "D" },
        { item: "postcard", qty: 45, size: { "h": 10, "w": 15.25, "uom": "cm" }, "status": "A" }
    ]
);
##### To retrieve the all documents ####
db.inventory.find({});


##### Insert Methods #####
db.collection.insertOne()  => Inserts a single document into a collection.
db.collection.insertMany() => Inserts multiple documents into a collection.

#### Update a Single Document ####
db.inventory.updateOne(
   { item: "paper" },
   {
     $set: { "size.uom": "cm", status: "P" },
     $currentDate: { lastModified: true }
   }
)

##### Update Multiple Documents #####
db.inventory.updateMany(
   { "qty": { $lt: 45 } },
   {
     $set: { "size.uom": "in", status: "P" },
     $currentDate: { lastModified: true }
   }
)

##### Replace a Document #####
db.inventory.replaceOne(
   { item: "paper" },
   { item: "paper", instock: [ { warehouse: "A", qty: 60 }, { warehouse: "B", qty: 40 } ] }
)

##### Delete Only One Document that Matches a Condition #####
db.inventory.deleteOne( {"age":24});

##### Delete All Documents that Match a Condition #####
db.inventory.deleteMany( {"age":24});

##### Delete All Documents #####
db.inventory.deleteMany({})