# JS Constructor Functions

1hr

## Learning objectives

- Explain why we use an object constructor
- Demonstrate setting up an object constructor function
- Create multiple objects
- Create a method for the object

Firstly, let's create a new directory and file:

```
mkdir object_constructors
cd object_constructors
touch object_constructors.js
```

We've seen how we can create objects in JS, we can do so with the object literal notation:

```js
var myObject = {};

myObject.shape = 'circle';
myObject.radius = 10;
```
We can also setup a "new" Object syntax.

```js
var myOtherObject = new Object();

myOtherObject.size = 6;
myOtherObject.color = 'red';
```

### But we have a problem

Let's say we want to create a few different houses. We could create separate objects for each house:

```js
var house1 = {
  sqFeet: 2000,
  bathrooms: 2,
  bedrooms: 3
};

var house2 = {
  sqFeet: 8000,
  bathrooms: 4,
  bedrooms: 6
};

var house3 = {
  sqFeet: 1000,
  bathrooms: 1,
  bedrooms: 1
};

```
This isn't an optimal solution. We would have to continue creating these individual objects to 'build' more houses.


## Javascript Object Constructor

In Javascript a constructor is a special type of function that is responsible for building an object.

Here we can create a house constructor function who is responsible for creating house objects.

```js
var House = function(sqFeet, bathrooms, bedrooms) {
  this.sqFeet = sqFeet;
  this.bathrooms = bathrooms;
  this.bedrooms = bedrooms;
};

var house1 = new House(1000, 3, 4);
var house2 = new House(2000, 4, 5);
```

We setup our constructor as we would normally but upper-case House. This is a convention in JS, it's not actually required. We can then create new objects using the new keyword.

'this' in a constructor function is set to the object we are creating.

So the houses we create have the attributes we passed in as arguments to the constructor functions.

```js
console.log( house1.sqFeet );
console.log( house2.bedrooms );
```

Just like on the object literals we created we can assign methods as attributes.

```js
var House = function(sqFeet, bathrooms, bedrooms) {
  this.sqFeet = sqFeet;
  this.bathrooms = bathrooms;
  this.bedrooms = bedrooms;
  this.numberOfRooms = function() {
    return(this.bathrooms + this.bedrooms);
  }
};
```

Let's try another one.

Let's create an Office constructor that makes offices that have a number of desks, and and number of meeting rooms, and a function that shows the average number of desks per meeting room.

```js
var Office = function(desks, meetingRooms) {
  this.desks = desks;
  this.meetingRooms = meetingRooms;

  this.averageDesksPerMeetingRoom = function() {
    return this.desks / this.meetingRooms;
  };
};

var office1 = new Office(100, 10);
var office2 = new Office(2, 2);

console.log(office1);
console.log(office1.averageDesksPerMeetingRoom());
```

[TASK] (45 mins): 

- Create a planet_spec.js file for testing 
- Create a Planet constructor that takes a name as an argument and make it available to the test file with module.exports
- Write a test that creates a new Planet and checks the Planet has the right name
- Create a SolarSystem constructor that takes in a name and has an initial empty array of planets.
- Export the SolarSystem constructor to make it available to other files
- Test that the SolarSystem has an initial empty array of planets.
- Add a method to the SolarSystem constructor that adds a planet to the array
- Write a test that instantiates a new SolarSystem, some Planets, adds the planets to the SolarSystem and tests the SolarSystem planets array is correct
















