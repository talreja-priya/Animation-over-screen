# Animation over screen

AnimationView is written in swift. It is a subclass of UIView and highly customizable. 

<p align="center">
  <img src="animation.gif" alt="animation" width="473.6" height="198">
</p>

## Installation
To install AnimationView, simply add `AnimationView.swift` to your project.

## Usage

Creating a AnimationView

```swift
let animationView = Animation(frame: self.view.bounds)
```

Set the colors with the `.imageColors` property or you can use `UIColor.randomColor()`

``` swift
animationView.colors = [UIColor.red, UIColor.green, UIColor.blue]

```

Add the subview

```swift
self.view.addSubview(animationView)
```

### Properties

The BirthRate refers to number of emitted objects created every second. Set the birthrate with the `.birthRate` property. The default birthrate is 2.0

``` swift
animationView.birthRate = 2.0
```


To start the animation, use

``` swift
animationView.startAnimation()
```


To stop the animation, use

``` swift
animationView.stopAnimation()
```
