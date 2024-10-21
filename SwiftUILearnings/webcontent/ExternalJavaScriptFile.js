// Fetch the button element from document using getElementById
var changeColorToRedButton = document.getElementById("changeBackgroundColorToRed");

// Add an event listener to button
changeColorToRedButton.addEventListener("click", changeColorToRed);

// Function definition, due to hoisting it doesn't matter that the function is declared here but used above in 
// addEventListener already, it won't give any issues.
function changeColorToRed() {
  document.body.style.backgroundColor = "red";
}

let someLetVariable = "let variable"
let buttonForLetVariableExample = document.getElementById("buttonForLetVariableExample");
buttonForLetVariableExample.addEventListener("click", exampleLetVariable);

function exampleLetVariable() {
    console.log("Defined a let variable someLetVariable, let's print it's value")
    console.log(someLetVariable)
    console.log("Let's change value for someLetVariable")
    someLetVariable = "let variable update value"
    console.log(someLetVariable)
}


// var

// Here we are assigning some value to someVarVariable which is actually declared at last. Due to hoisting this code
// works just fine. Even the funtion exampleVarVariable is used first and then the declaration comes later, and because
// functions are also hoisted, it works fine.
someVarVariable = "var variable";
let buttonForVarVariableExample = document.getElementById("buttonForVarVariableExample");
buttonForVarVariableExample.addEventListener("click", exampleVarVariable);

function exampleVarVariable() {
    console.log("Defined a var variable someVarVariable, let's print it's value")
    console.log(someVarVariable)
    console.log("Let's change value for someVarVariable")
    someVarVariable = "var variable updated value"
    console.log(someVarVariable)
}

var someVarVariable;

// Function with return values
let buttonForCallingFunctionReturningSomeValue = document.getElementById("buttonForCallingFunctionReturningSomeValue");
buttonForCallingFunctionReturningSomeValue.addEventListener("click", exampleFunctionReturningSomeValue);

let contentFromReturningFunctionElement = document.getElementById("contentFromReturningFunction");

// Notice that in function definition after brackets there is no indication required which suggests this is a funtion which
// will return some value. It's only in funtion implementation last line with keyword return one can figure out it's a returning
// funtion
function exampleFunctionReturningSomeValue() {
  let randomValue = Math.random()
  console.log("Generated random value")
  console.log(randomValue)
  contentFromReturningFunctionElement.textContent = randomValue
  return randomValue
}

// Multiple listeners for a single event

let multipleEventListenerTargetOneElement = document.getElementById("multipleEventListenerTargetOne");
let multipleEventListenerTargetTwoElement = document.getElementById("multipleEventListenerTargetTwo");

let buttonWithMultipleEventHandlersForSingleEvent = document.getElementById("buttonWithMultipleEventHandlersForSingleEvent");
buttonWithMultipleEventHandlersForSingleEvent.addEventListener("click", eventHandlerOne);
buttonWithMultipleEventHandlersForSingleEvent.addEventListener("click", eventHandlerTwo);

function eventHandlerOne() {
  multipleEventListenerTargetOneElement.textContent = "Handled event in handler one";
  multipleEventListenerTargetOneElement.style.color = "red";
}

function eventHandlerTwo() {
  multipleEventListenerTargetTwoElement.textContent = "Handled event in handler two";
  multipleEventListenerTargetTwoElement.style.color = "blue";
}

// Using Event handler properties

let buttonWithEventHandlerPropertiesSet = document.getElementById("buttonWithEventHandlerPropertiesSet");
let eventHandlerPropertiesTargetElement = document.getElementById("eventHandlerPropertiesTarget");

buttonWithEventHandlerPropertiesSet.onclick = eventHandlerAssignedToOnClick

function eventHandlerAssignedToOnClick() {
  console.log("Event handled which was assigned to event handler properties");
  eventHandlerPropertiesTargetElement.textContent = "Event handled which was assigned to event handler properties";
}