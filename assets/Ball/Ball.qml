import bb.cascades 1.0

Container {
    id: ballContainer
    
    layout: DockLayout {
            }
    property int ballWidth: 526
    property int ballHeight: 464
    property bool isAss: false
    
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: ballContainer.ballHeight
    preferredWidth: ballContainer.ballWidth 
    
    onIsAssChanged: {
        if (isAss)
        {
            at(0).opacity = 1;
            at(1).opacity = 0;
        }
        else
        {
            at(0).opacity = 0;
            at(1).opacity = 1;
        }
    }
    
    onCreationCompleted: {
        var ballAssCreated = ballAssComponent.createObject(parent)
        add(ballAssCreated);
        ballAssCreated = ballFaceComponent.createObject(parent)
        add(ballAssCreated);
    }
    
    attachedObjects: [
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
    ]
}