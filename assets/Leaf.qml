import bb.cascades 1.0

ImageView {
    imageSource: "asset:///images/chamomile_leaf.png"
    property int initialRotation: 0
    property bool isDragable: true
    property int firstTouchPositionX: 0
    property int firstTouchPositionY: 0
    signal leafIsGone()
    function resetLeaf() {
        translationY = 0;
        translationX = 0;
        rotationZ = initialRotation;
        isDragable = true;
        visible = true;
    }
    onTouch: {
        // Checking for a press, then set the state variables we need.
        if (! isDragable) {
            return;
        }
        if (event.isDown()) {
            firstTouchPositionX = event.windowX;
            firstTouchPositionY = event.windowY;
        } else if (event.isMove()) {
            var currentY = event.windowY - firstTouchPositionY;
            var currentX = event.windowX - firstTouchPositionX;
            // lets count Z rotation
            // FIXME: find a better way to get a rotation angle.
            rotationZ = - ((Math.atan(currentX / currentY) * 180 / Math.PI)) + initialRotation;
            translationY = currentY;
            translationX = currentX;
        } else if (event.isUp()) {
            isDragable = false;
            leafIsGone();
        }
    }
    onCreationCompleted: {
        rotationZ = initialRotation;
    }
}
