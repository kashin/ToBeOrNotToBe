import bb.cascades 1.0
import tb.ntb 1.0
import custom.lib 1.0

Container {
    id: ballContainer
    
    layout: DockLayout {
            }
    property int ballWidth: 526
    property int ballHeight: 464
    property int centerX: 0
    property int centerY: 0

    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: ballContainer.ballHeight
    preferredWidth: ballContainer.ballWidth 
    
    
    onCreationCompleted: {
        /*var ballAssCreated = ballAssComponent.createObject(parent)
        add(ballAssCreated);
        ballAssCreated = ballFaceComponent.createObject(parent)
        add(ballAssCreated);*/
    }
    
    
    onCenterXChanged: {
    }
    
    onCenterYChanged: {
    }
    // Create the CircularSlider and lay it out
            // just like any other control.
            CircularSlider {
                id: circularSlider
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                // Capture the valueChanged signal and update
                // the label.
                value: 1
                onValueChanged: {
                    console.log(value);
                    label.text = value;
                }
            } // Ends the circular slider
    Label {
        id: label
        text: "Olala"
    }
    Button {
        id: button
        text: "PUUUsh"
        onClicked: {
            circularSlider.value = 10;
        }
    }
    attachedObjects: [
            BallLogic {
                 id: ballLogic
                 value: 1
                 onValueChanged: {
                             
                 }
           }
    ]
    /*attachedObjects: [
            ComponentDefinition {
                id: ballAssComponent
                content: ImageView {
                        id: ballAss
                        imageSource: "asset:///images/ball_ass2.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        scalingMethod: ScalingMethod.Fill
                        opacity: 0
                    }
            },
            ComponentDefinition {
                id: ballFaceComponent
                content: ImageView {
                        id: ballFace
                        imageSource: "asset:///images/ball_face2.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        scalingMethod: ScalingMethod.Fill
                        opacity: 1
                    }
            }
    ]*/
}