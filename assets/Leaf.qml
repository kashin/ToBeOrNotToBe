import bb.cascades 1.0

ImageView {
    id: leafImageView
    imageSource: "asset:///images/chamomile_leaf.png"
    overlapTouchPolicy: OverlapTouchPolicy.Allow
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: 200
    preferredWidth: 200
    scalingMethod: ScalingMethod.AspectFit

    property int initialRotation: 0
    property int initialTranslationX: 0
    property int initialTranslationY: 0
    property bool isDragable: true
    property int firstTouchPositionX: 0
    property int firstTouchPositionY: 0
    property bool anotherLeafDragStarted: false
    property bool isDragStarted: false

    signal leafIsGone(variant leaf)
    signal dragStarted(variant leaf)
    signal dragStoped(variant leaf)

    function resetLeaf() {
        translationY = initialTranslationY;
        translationX = initialTranslationX;
        rotationZ = initialRotation;
        isDragable = true;
        visible = true;
        anotherLeafDragStarted = false;
        isDragStarted = false;
    }

    onInitialTranslationXChanged: {
        translationX = initialTranslationX;
    }
    onInitialTranslationYChanged: {
        translationY = initialTranslationY;
    }
    onInitialRotationChanged: {
        rotationZ = initialRotation;
    }

    onTouch: {
        if (! isDragable || anotherLeafDragStarted) {
            return;
        }

        // Checking for a press, then set the state variables we need.
        if (event.isDown()) {
            firstTouchPositionX = event.windowX;
            firstTouchPositionY = event.windowY;
            isDragStarted = true;
            dragStarted(leafImageView.objectName);
        } else if (event.isMove() && isDragStarted) {
            var currentY = event.windowY - firstTouchPositionY;
            var currentX = event.windowX - firstTouchPositionX;
            // lets count Z rotation
            // FIXME: find a better way to get a rotation angle.
            rotationZ = - ((Math.atan(currentX / currentY) * 180 / Math.PI)) + initialRotation;
            translationY = initialTranslationY + currentY;
            translationX = initialTranslationX + currentX;
        } else if (event.isUp() && isDragStarted) {
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
}
