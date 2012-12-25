import bb.cascades 1.0

ImageView {
    id: leafImageView
    imageSource: "asset:///images/chamomile_leaf.png"
    overlapTouchPolicy: OverlapTouchPolicy.Allow
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: 220
    preferredWidth: 220
    scalingMethod: ScalingMethod.AspectFit

    property int initialRotation: 0
    property int initialTranslationX: 0
    property int initialTranslationY: 0
    property bool isDragable: true
    property int firstTouchPositionX: 0
    property int firstTouchPositionY: 0
    property bool anotherLeafDragStarted: false
    property bool isDragStarted: false
    property int previousCurrentY: 0
    property int fullRoundsCount: 0
    property int countBeforeRemoveInitialRotation: 5
    property int ignoreTouchEventsFurtherThan: 10

    signal leafIsGone(variant leaf)
    signal dragStarted(variant leaf)
    signal dragStoped(variant leaf)

    function resetLeaf() {
        isDragable = true;
        visible = true;
        anotherLeafDragStarted = false;
        isDragStarted = false;
        translationY = initialTranslationY;
        translationX = initialTranslationX;
        rotationZ = initialRotation;
        countBeforeRemoveInitialRotation = 5;
        implicitAnimationController.enabled = true;
    }

    onInitialTranslationXChanged: {
        if (!isDragStarted) {
            translationX = initialTranslationX;
        }
    }
    onInitialTranslationYChanged: {
        if (!isDragStarted) {
            translationY = initialTranslationY;
        }
    }
    onInitialRotationChanged: {
        if (!isDragStarted) {
            rotationZ = initialRotation;
        }
    }

    onTouch: {
        if (! isDragable || anotherLeafDragStarted) {
            return;
        }

        // Checking for a press, then set the state variables we need.
        if (event.isDown()) {
            // FIXME: we should use a flower's center coordinates as a base coordinates.
            firstTouchPositionX = event.windowX;
            firstTouchPositionY = event.windowY;
            isDragStarted = true;
            previousCurrentY = 0;
            fullRoundsCount = 0;
            dragStarted(leafImageView.objectName);
        } else if (event.isMove() && isDragStarted) {
            var currentY = event.windowY - firstTouchPositionY;
            var currentX = event.windowX - firstTouchPositionX;
            // ignoring if last touch event is somewhere reeeeally close to the original touch position
            if (currentX >= -ignoreTouchEventsFurtherThan && currentX <= ignoreTouchEventsFurtherThan &&
                currentY >= -ignoreTouchEventsFurtherThan && currentY <= ignoreTouchEventsFurtherThan ) {
                    return;
                }
            // lets count Z rotation
            var angle = - ((Math.atan(currentX / currentY) * 180 / Math.PI));
            if (currentY > 0) {
                var additionalAngle = 180;
                if (previousCurrentY < 0 && currentX < 0) {
                    fullRoundsCount--;
                }
                additionalAngle += 360*fullRoundsCount;
                rotationZ = angle + additionalAngle + initialRotation;
            } else if (currentY < 0 ){
                var additionalAngle = 0;
                if (previousCurrentY > 0 && currentX < 0) {
                    fullRoundsCount++;
                }
                additionalAngle += 360*fullRoundsCount;
                rotationZ = angle + additionalAngle + initialRotation;
            }
            if (countBeforeRemoveInitialRotation >= 0) {
                countBeforeRemoveInitialRotation--;
                if (countBeforeRemoveInitialRotation == 0) {
                    implicitAnimationController.enabled = false;
                    // FIXME: do we need this stupid 'if else' logic?
                    if ( initialRotation >= 270 && initialRotation < 360) {
                        initialRotation = 360;
                    } else {
                        initialRotation = 0;
                    }
                    rotationZ = angle + additionalAngle + initialRotation;
                    implicitAnimationController.enabled = true;
                }
            }
            previousCurrentY = currentY
            translationY = initialTranslationY + currentY;
            translationX = initialTranslationX + currentX;
        } else if ( (event.isUp() || event.isCancel() ) && isDragStarted) {
            dragStoped(leafImageView.objectName);
            isDragable = false;
            isDragStarted = false;
            fadeOutTransition.play();
        }
    }
    onCreationCompleted: {
        rotationZ = initialRotation;
        translationX = initialTranslationX;
        translationY = initialTranslationY;
    }
    animations: [
        FadeTransition {
            id: fadeOutTransition
            fromOpacity: 1.0
            toOpacity: 0.0
            duration: 300
            target: leafImageView
            onEnded: {
                target.leafIsGone(leafImageView);
            }
        }
    ]
    attachedObjects: [
         ImplicitAnimationController {
             id: implicitAnimationController
             propertyName: "rotationZ"
             enabled: true
         }
    ]
}
