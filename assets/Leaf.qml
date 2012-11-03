import bb.cascades 1.0

ImageView {
    imageSource: "asset:///images/chamomile_leaf.png"
    overlapTouchPolicy: OverlapTouchPolicy.Deny
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
    signal leafIsGone()
    function resetLeaf() {
        translationY = initialTranslationY;
        translationX = initialTranslationX;
        rotationZ = initialRotation;
        isDragable = true;
        visible = true;
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
        if (! isDragable) {
            return;
        }

        // Checking for a press, then set the state variables we need.
        if (event.isDown()) {
            firstTouchPositionX = event.windowX;
            firstTouchPositionY = event.windowY;
        } else if (event.isMove()) {
            var currentY = event.windowY - firstTouchPositionY;
            var currentX = event.windowX - firstTouchPositionX;
            // lets count Z rotation
            // FIXME: find a better way to get a rotation angle.
            rotationZ = - ((Math.atan(currentX / currentY) * 180 / Math.PI)) + initialRotation;
            translationY = initialTranslationY + currentY;
            translationX = initialTranslationX + currentX;
        } else if (event.isUp()) {
            console.log("leaf is not dragable anymore");
            isDragable = false;
            leafIsGone();
        }
    }
    onCreationCompleted: {
        rotationZ = initialRotation;
        translationX = initialTranslationX;
        translationY = initialTranslationY;
    }
}
