// Select the element to be removed
let element = document.querySelector("#element-to-remove");

// Remove the element from its parent node
element.parentNode.removeChild(element);

/**
 * Alternatively, you could use the remove method to remove the element, like this:
 * // Select the element to be removed
let element = document.querySelector("#element-to-remove");

// Remove the element from the page
element.remove();

This code uses the querySelector method to select the element to be removed, and then uses the remove method to remove the element from the page. This method is more concise than the first example, but it is not supported in older browsers, so you may want to use the first example if you need to support older browsers.
 */