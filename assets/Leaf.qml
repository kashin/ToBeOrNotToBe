import bb.cascades 1.0

ImageView {
    imageSource: "asset:///images/chamomile_leaf.png"
    overlapTouchPolicy: OverlapTouchPolicy.Deny
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
        if (! isDragable) {
            return;
        }
        if (event.propagationPhase == PropagationPhase.None) {
            console.log("received None event");
            return;
        }
        if (event.propagationPhase == PropagationPhase.Capturing) {
            console.log("received Capturings event");
            return;
        }
        if (event.propagationPhase == PropagationPhase.Bubbling) {
            console.log("received Bubbling event");
            return;
        }
        if (event.propagationPhase === PropagationPhase.AtTarget) {
            console.log("received at-target event");
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
                translationY = currentY;
                translationX = currentX;
            } else if (event.isUp()) {
                console.log("leaf is not dragable anymore");
                isDragable = false;
                leafIsGone();
            }
        }
    }
    onCreationCompleted: {
        rotationZ = initialRotation;
    }
}
