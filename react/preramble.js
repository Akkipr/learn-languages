// functions in general 
// arrow function

/*
const DoSomething = () => {

}

export const DoSomething = () => {

}

*/

export const DoSomething = () => {

}
// Inside onClick, you can pass a function or you can have an anonymous function (without a name)
// execute commands without declaring a function
<button>
    onClick={() => {
        console.log("Hello");
    }}
</button>

// ternary operators
let age = 10;
let name = age > 10 && "Pedro"; // if age > 10, let name be Pedro
let name2 = age > 10 || "Pedro"; // if age is not > 10, let name be Pedro
let name3 = age > 10 ? "Pedro" : "Jack"; // if age > 10, let name be Pedro, else Jack (we saw this in Python)
const Component = () => {
    return age > 10 ? <div> Pedro </div> : <div> Jack </div>
};

// Objects
const person = {
    name: "pedro",
    age,                    // since we have the variable age on line 27, we don't need to repeat it. "age : age," also works, or "age,""
    isSleeping: false,
};
const { firstname, age1, isMarried} = person;

// Copy objects from one to another (spread operator)
const person2 = {...person, name: "Jack"};

// Copy arrays
const lists = [10,20,30];
const list2 = [...lists, 40];

// three fundamental arrays methods: map, filter, reduce. Reduce is not rlly used in React
let names = ["Pedro", "Marlon", "Dexter"];

names.map((name) => {
    return name + "1";        // every element is the name with 1 added at the end
    // return <h1>{name}</h1>
});

names.filter((name) => {
    return name != "Pedro";        // removes all the Pedro in the names
    // return <h1>{name}</h1>
});
