/**
 * A lexical scope is the set of variables, objects, and functions that are accessible in a given context. It is related to closure because a closure captures variables from its enclosing lexical scope. This means that a closure can access and use the variables from its enclosing lexical scope, even when the function where it was created is not in the same context.
 */

 let outerFunction = () => {
    let a = 5;
    let innerFunction = () => {
        console.log(a); // This will print the value of 'a' even though it is not in the same scope
    }
}

/**
 * In this example, the innerFunction will be able to access the variable 'a' from the outerFunction's lexical scope, even when outerFunction is not called. This is an example of how a closure captures variables from its enclosing lexical scope.
 */