import bb.cascades 1.0
import BallLogic 1.0

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
        var ballAssCreated = ballAssComponent.createObject(parent)
        add(ballAssCreated);
        ballAssCreated = ballFaceComponent.createObject(parent)
        add(ballAssCreated);
    }
    
    
    onCenterXChanged: {
    }
    
    onCenterYChanged: {
    }
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