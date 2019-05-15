# MBAnimatedTextfield

### Make any UITextfield as Animated textField just by subclassing the textfield from MBAnimatedTextfield.

```
 var myTxtField:MBAnimatedTextfield = {
        let txtFld = MBAnimatedTextfield(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        txtFld.borderStyle = .bezel
        txtFld.placeholder = "Enter the Name"
        return txtFld
    }()
    
       //MARK: LifeCycleMethod
    override func viewDidLoad() {
        super.viewDidLoad()
        myTxtField.center = view.center
        myTxtField.mbDelegate = self
        view.addSubview(myTxtField)
    }
    
    extension ViewController:MBTextfielDelegates {}
 ```
    
 You can change the animation style of textfield as it is an enum type AnimationPosition eg..
 
 ```
 myTxtField.animationPos = .Center
 ```

 or
 ```
 myTxtField.animationPos = .Start
 ```
 
 Enjoy 👍
