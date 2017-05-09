---
title: React, JavaScript, and Related Notes
author: Adron Hall
date: 2017-05-04:18:17:25
template: doc.jade
---
### React, JavaScript, and Related Notes

https://facebook.github.io/react/docs/hello-world.html
https://github.com/mozilla-services/react-jsonschema-form
https://mozilla-services.github.io/react-jsonschema-form/
https://github.com/ReactTraining/react-router

### Currently working through these.

https://facebook.github.io/react/docs/installation.html#creating-a-new-application
https://facebook.github.io/react/tutorial/tutorial.html

### Things I've read:

* https://github.com/petehunt/react-howto

### Things I aim to read:

* https://scotch.io/tutorials/learning-react-getting-started-and-concepts

***Currently Working Through...***

* [Docs on Folder Structure Created...](https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#folder-structure)
* [Intro to React](https://facebook.github.io/react/tutorial/tutorial.html)

# React Notes

## Components Class / Type

React Component Class / React Component Type - A component takes in parameters called props (properties?) and returns a hierarchy of views to display via the render method. Below is a React component.

```
class ShoppingList extends React.Component {
  render() {
    return (
      <div className="shopping-list">
        <h1>Shopping List for {this.props.name}</h1>
        <ul>
          <li>Instagram</li>
          <li>WhatsApp</li>
          <li>Oculus</li>
        </ul>
      </div>
    );
  }
}
```

## The `createElement()` Function

```
React.createElement(
  type,
  [props],
  [...children]
)
```

This code creates a new React element of the given type, the type being either a tag name string such as a `div` or `span` or a React component type like the class or function as defined above.

## The `cloneElement()` Function

```
React.cloneElement(
  element,
  [props],
  [...children]
)
```

# ES6 Arrow Functions, Classes, and `Super()`

## The Classes Capabilities of ES6

> [MDN Project](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes#Super_class_calls_with_super)

The super keyword is used to call functions on an object's parent.

```
class Cat { 
  constructor(name) {
    this.name = name;
  }
  
  speak() {
    console.log(this.name + ' makes a noise.');
  }
}

class Lion extends Cat {
  speak() {
    super.speak();
    console.log(this.name + ' roars.');
  }
}

var l = new Lion('Fuzzy');
l.speak();
```