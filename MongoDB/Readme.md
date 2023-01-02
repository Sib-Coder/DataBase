 ```docker run -p 27017:27017 --name mdbsib mongo```<br/>

```sudo docker exec -it mdbsib mongo``` - вход в монгошел<br/>
```> show databases;```- показать БД<br/>
admin   0.000GB<br/>
config  0.000GB<br/>
local   0.000GB<br/>
```> use sibcoder```- переключаемся (создаём и переключаемся)<br/>
switched to db sibcoder<br/>
```> db```<br/>
sibcoder<br/>
```> use test```<br/>
switched to db test<br/>
```> db```<br/>
test<br/>
```> use sibcoder```<br/>
switched to db sibcoder<br/>
```> db```<br/>
sibcoder<br/>
```show collections``` - показать коллекции <br/>
test<br/>
```bash
> db.test.insertMany([{}])
{        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("63b280a42d768bcad1f30553")
        ]}
```
```bash
> db.test.insertMany([{name:"sib-coder", phone:"89234309479"}])
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("63b280f72d768bcad1f30554")
        ]
}
```
```bash
> db.test.insertMany([{name:"RomanL", phone:"89794579475"},{name:"Daniil", phone:"210104"}])
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("63b281652d768bcad1f30555"),
                ObjectId("63b281652d768bcad1f30556")
        ]
}
```
```bash
> db.test.find()
{ "_id" : ObjectId("63b280a42d768bcad1f30553") }
{ "_id" : ObjectId("63b280f72d768bcad1f30554"), "name" : "sib-coder", "phone" : "89234309479" }
{ "_id" : ObjectId("63b281652d768bcad1f30555"), "name" : "RomanL", "phone" : "89794579475" }
{ "_id" : ObjectId("63b281652d768bcad1f30556"), "name" : "Daniil", "phone" : "210104" }
```> db.test.find({name:"Daniil"})
{ "_id" : ObjectId("63b281652d768bcad1f30556"), "name" : "Daniil", "phone" : "210104" }
```> db.test.find({name:"210104"})
```> db.test.find({phone:"210104"})
{ "_id" : ObjectId("63b281652d768bcad1f30556"), "name" : "Daniil", "phone" : "210104" }
```
```bash
> a =[
... {name : "Alice",
... phone : "4565767596"}
... ,
... {name : "Bob",
... phone: "79435459757"}]
[
        {
                "name" : "Alice",
                "phone" : "4565767596"
        },
        {
                "name" : "Bob",
                "phone" : "79435459757"
        }
]
```
```bash
> db.test.insertMany(a)
{
        "acknowledged" : true,
        "insertedIds" : [
                ObjectId("63b282932d768bcad1f30557"),
                ObjectId("63b282932d768bcad1f30558")
        ]
}
```
```bash
> exit
bye
```


