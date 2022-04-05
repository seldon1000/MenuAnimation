# MenuAnimation

This is part of a greater effort to explain the importance of Animation&Motion inside mobile applications and games, developed @ Apple Developer Academy | Naples. The effort consists in four different repositories, each containing a single animation. You'll find the main GitHub repository containing further information at the link below.

https://github.com/seldon1000/SwiftUI_Animations

MenuAnimation is a XCode project, containing an application prototype showcasing an open/close animation of a menu and a detailed explanation of how to implement the animation in SwiftUI. 

## Scale&Size
The menu animation covers size and scale changes, used to deliver a nice, smooth and coherent animation  Let's take a quick look at the animation, then we'll analyze the code.

![Alt Text](https://github.com/seldon1000/SwiftUI_Animations/blob/main/ezgif-2-78cdc7af88.gif)

What's needed to implement this animation? Let's take a close look at the code and start with the boring part. This is the source code from the MenuAnimationApp file, the starting point of the prototype.

```swift
import SwiftUI

@main
struct SwiftUI_AnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            Start()
                .preferredColorScheme(.light)
                .statusBar(hidden: true)
        }
    }
}
```

Let's move on to the Start file source code. Okay, now what do we have here? We have a ```showMenu``` @State variable, which will indicate when to show the menu. The UI is composed by a VStack, which aligns its content vertically. Inside the VStack, we have a ```MainView``` and, optionally based on the ```showMenu``` value, a ```MenuView```.

```swift
import SwiftUI

struct Start: View {
    @State var showMenu: Bool = false
    
    var body: some View {
        VStack(spacing: 48) {
            MainView(showMenu: $showMenu)
            if showMenu {
                MenuView(showMenu: $showMenu)
            }
        }
        .ignoresSafeArea()
    }
}
```

Now, let's dig deeper. Below, we have the MainView file source code. We have a ```showMenu``` @Binding variable, bound to the one declared previously inside the Start file. The UI is composed by a ZStack, which will stack its components on top of each other. In fact, inside the ZStack, we have a pink color and a simple text. The ZStack is modified with a frame ```.frame(width: UIScreen.main.bounds.width * (showMenu ? 0.5 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.5 : 1.0))```. What does that mean? The ZStack will occupy the whole screen when the menu is hidden, otherwise it will scale down proportionally to a 0.5 factor (half screen). But how does that happen? We have the ```onTapGesture``` and the ```onLongPressGesture``` modifiers, which are triggered respectively when the user taps or long presses on the ZStack. When the user long presses on the ZStack, we have a call to the ```withAnimation``` function. As also stated by the Apple's SwiftUI documentation, the ```withAnimation``` function immediately executes its closure's content, applying the changes, and updates the UI components affected by those changes with an animation, which will follow the curve/easing we pass as input parameter. ```withAnimation(.easeInOut)``` in our case changes the ```showMenu``` value after a long press gesture by user. The change will be immediate internally, but the UI will update with an animation which will follow the easeInOut timing function, which provides a gradual starting and ending transition. So, when the value of ```showMenu``` is true, the ```MenuView``` will start appearing on the screen, while at the same time the ```MainView``` will resize itself to make space for the menu. The ```onTapGesture``` will revert the ```showMenu``` value in order to close the menu, with exactly the same animation we've seen for the opening, but reversed. ```withAnimation``` implements what is called "explicit animation", meaning that we explicitly tell SwiftUI which animation we want to use and for which internal changes (like with the ```showMenu``` variable changes).

```swift
struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Color.pink
                .opacity(0.2)
            Text("hold")
                .font(.system(size: 28, design: .serif))
                .scaleEffect(showMenu ? 0.5 : 1.0)
        }
        .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.5 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.5 : 1.0))
        .onTapGesture {
            if showMenu {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
        }
        .onLongPressGesture {
            withAnimation(.easeInOut) {
                showMenu = true
            }
        }
    }
}
```

Pretty cool ah? For more animations, refer to the link down below.

https://github.com/seldon1000/SwiftUI_Animations
