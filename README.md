UIMenuController-Sample
=======================

Show the UIMenuController and Display Custom Edit Menus for UITableViewController on iOS 7
This application demonstrates adding a custom `UIMenuController` with custom menu options to a `UITableViewCell`.

## Features
* You need to call [-becomeFirstResponder](developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/becomeFirstResponder) on the view or view controller.
* Your view or view controller needs to implement [-canBecomeFirstResponder]((developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/becomeFirstResponder)) (returning YES).
* Optionally, your view or view controller can implement [-canPerformAction:action withSender:sender](https://developer.apple.com/library/ios/documentation/uikit/reference/UIResponder_Class/Reference/Reference.html#//apple_ref/occ/instm/UIResponder/canPerformAction%3awithSender%3a) to show/hide menu items on an individual basis.

## Custom Menu Items
The code is a little more involved if you want to use custom menu options, but offers a lot of flexibility. 
It's your responsibility to detect the long press and show the custom menu, and the easiest way to do this is using UILongPressGestureRecognizer on the table cell:

```
UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
[cell addGestureRecognizer:recognizer];
```
For the menu to appear, the target view must be in the responder chain. 
Many UIKit views can't become a responder by default, so you may need to subclass them to return **YES** for **canBecomeFirstResponder**.

<p align="center" >
<a href="http://s1282.photobucket.com/user/jigarm_0809/media/screenshot_zpsfb0daa28.png.html" target="_blank"><img src="http://i1282.photobucket.com/albums/a534/jigarm_0809/screenshot_zpsfb0daa28.png" border="0" alt="Screnshot with UIMenu Items photo screenshot_zpsfb0daa28.png" width="266" height="500"/></a>

<a href="http://s1282.photobucket.com/user/jigarm_0809/media/iOSSimulatorScreenShot30-Jun-201441536pm_zpsf999485c.png.html" target="_blank"><img src="http://i1282.photobucket.com/albums/a534/jigarm_0809/iOSSimulatorScreenShot30-Jun-201441536pm_zpsf999485c.png" border="0" alt="UIMenuview Items photo iOSSimulatorScreenShot30-Jun-201441536pm_zpsf999485c.png" width="266" height="500"/></a>
</p>

## License

The MIT License (MIT)

Copyright (c) 2014 Jigar M

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
