## RUBY CAPSTONE PROJECT : JS LINTER

</h1>
JS-LINTER is a JavaScript linter for beginners, it provides feedback about errors or warning in code little by little.
</h1>

## Screenshot

![img](/images/main.png)

## Features

JS-LINTER scans the given javascript code and returns a detailed report including the line and position of the error.
The linter checks for the following errors :

- The use of camelCase for identifier names (variables and functions).
- The use of spaces around operators ( = + - \* / ).
- The use of space after commas.
- The use 2 spaces for indentation of code blocks.
- Checks if each line of code end with a semicolon.
- Checks for the length of each line of code.

## Example of good and bad code

### Good

```bash
function sumAdd(a, b) {
  let add = 10;
  return Add + a + b;
}
```

### Bad

```bash
function SumAdd(a,b) {
let Add = 10;
 return Add+a+ b
}
```

## Built With

- Ruby

- Visual code

## Live Demo

[Live Demo Link](https://repl.it/@Sayr0s/JSlinter)

## Prerequisites

Ruby,Text editor,Github profile and Git.

## Getting started

Before getting started make sure that ruby is installed.

- Start by cloning this repository to your local machine :

```bash
git clone git@github.com:khalilhamdii/JS_linter.git
```

- Access the cloned repoository :

```bash
cd JS_linter
```

- Run this command :

```bash
bin/main
```

- Enter the path of Javascript file you want to scan and click ENTER.

## Testing

In order to run the tests, RSPEC should be installed.

- Please run the following command line in your terminal to install :

```bash
gem install rspec
```

- When the installation is complete, type this command inside JS_linter folder to run the tests :

```bash
rspec
```

## Authors

👤 Khalil Hamdi

- Github: [@khalilhamdii](https://github.com/khalilhamdii)

- LinkedIn: [LinkedIn](https://www.linkedin.com/in/khalilhamdi/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the issues page.

Show your support

Give a ⭐️ if you like this project!

## 📝 License

This is a Ruby capstone project.Capstone projects are solo projects requested at the end of the each of the Microverse Main Technical Curriculum sections.
All rights are reserved to Khalil Hamdi.
