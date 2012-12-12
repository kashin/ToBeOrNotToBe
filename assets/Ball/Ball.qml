import bb.cascades 1.0
import tb.ntb 1.0
import custom.lib 1.0

Container {
    id: ballContainer
    
    layout: DockLayout {
            }
    property int coordinateX: 0
    property int coordinateY: 0

    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center 
    preferredHeight: 600
    preferredWidth: 600
    
    onCreationCompleted: {
        /*var ballAssCreated = ballAssComponent.createObject(parent)
        add(ballAssCreated);
        ballAssCreated = ballFaceComponent.createObject(parent)
        add(ballAssCreated);*/
    }
    
    
    onCoordinateXChanged: {
        ball.centerX = ballContainer.coordinateX;
    }
    
    onCoordinateYChanged: {
        ball.centerX = ballContainer.coordinateX;
    }
    // Create the CircularSlider and lay it out
            // just like any other control.
            BallView {
                id: ball
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                // Capture the valueChanged signal and update
                // the label.
                value: 1
                onValueChanged: {
                    console.log(value);
                    //label.text = value;
                }
                onCenterXChanged: {
                }
                onCenterYChanged: {
                }
            } // Ends the circular slider
    /*Label {
        id: label
        text: "Olala"
    }
    Button {
        id: button
        text: "PUUUsh"
        onClicked: {
            circularSlider.value = 10;
        }
    }*/
    /*attachedObjects: [
            BallLogic {
                 id: ballLogic
                 value: 1
                 onValueChanged: {
                             
                 }
           }
    ]*/
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