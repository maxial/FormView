# FormView

<div align="center">
  <a href="https://github.com/maxial/FormView/actions/workflows/.codecov.yml">
    <img src="https://github.com/maxial/FormView/actions/workflows/.codecov.yml/badge.svg?branch=main"/>
  </a>
  <a href="https://codecov.io/gh/maxial/FormView" >
    <img src="https://codecov.io/gh/maxial/FormView/branch/main/graph/badge.svg?token=QI9E6DH3YA"/>
  </a>
  <a href="https://swiftpackageindex.com/maxial/FormView" >
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmaxial%2FFormView%2Fbadge%3Ftype%3Dswift-versions"/>
  </a>
  <a href="https://swiftpackageindex.com/maxial/FormView" >
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmaxial%2FFormView%2Fbadge%3Ftype%3Dplatforms"/>
  </a>
</div>
<br>

An easy-to-use library for working with a group of **TextFields**.

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [License](#license)

## Features

- Automatic transition between **TextFields** upon submission
- Validation of **TextFields** based on specified rules
- Prevention of incorrect input based on specified rules

## Usage

```swift
struct ContentView: View {
    
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var emailFailedRules: [TextValidationRule] = []
    
    var body: some View {
        FormView {
            FormField(
                "Email",
                text: $email,
                validationRules: [.email],
                failedValidationRules: $emailFailedRules
            )
            if emailFailedRules.isEmpty == false {
                Text("Email")
                    .foregroundColor(.red)
            }
            FormField(
                "Phone",
                text: $phone,
                validationRules: [.digitsOnly],
                inputRules: [.digitsOnly]
            )
        }
    }
}
```

`ValidationRules` are used for automatic validation of text during input. All rules that have not passed the validation come with the `failedValidationRules`.

`InputRules` are used to prevent incorrect input.

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code.

In Xcode 14 or later, select `File > Add Packages...` In the search bar, type

```
https://github.com/maxial/FormView
``` 

Then proceed with installation.

You can add **FormView** as a dependency to the `dependencies` value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/maxial/FormView", from: "main"),
]
```

## License

FormView is released under the MIT license. [See LICENSE](https://github.com/maxial/FormView/blob/main/LICENSE) for details.
