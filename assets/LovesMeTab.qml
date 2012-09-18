import bb.cascades 1.0

Page {
    id: lovesMeTab
    function resetImage() {
        chamomileLeaf.isDraged = true;
    }
    actions: [
        ActionItem {
            title: qsTr("Reset image")
            onTriggered: {
                lovesMeTab.resetImage();
            }
        }
    ]
    property int maxLeafMovedPosition: 100
    // main container of the page
    Container {
        layout: StackLayout {
        }
        Label {
            layoutProperties: StackLayoutProperties {
                horizontalAlignment: HorizontalAlignment.Center
            }
            text: qsTr("Loves Me Or Not")
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
            }
        }
        Divider {
        }
        Container {
            layout: AbsoluteLayout {
            }
            preferredWidth: 768
            preferredHeight: 1024
            ImageView {
                id: chamomileLeaf
                imageSource: "asset:///images/chamomile_leaf.png"
                property bool isDraged: true
                property bool canGoBackToCenter: true
                property int firstTouchPositionX: 0
                property int firstTouchPositionY: 0
                property int initialPositionX: 400
                property int initialPositionY: 270
                layoutProperties: AbsoluteLayoutProperties {
                    id: leafLayoutProperties
                    positionX: 400
                    positionY: 270
                }

                onTouch: {
                    // Checking for a press, then set the state variables we need.
                    if (! isDraged) {
                        return;
                    }
                    if (event.isDown()) {
                        firstTouchPositionX = event.windowX;
                        firstTouchPositionY = event.windowY;
                        isDraged = true;
                    } else if (event.isMove()) {
                        var currentY = event.windowY - firstTouchPositionY;
                        var currentX = event.windowX - firstTouchPositionX;
                        if (currentY >= lovesMeTab.maxLeafMovedPosition || currentX >= lovesMeTab.maxLeafMovedPosition) {
                            //leaf can't go back to center, it is lost for us :(
                            canGoBackToCenter = false;
                        }
                        // lets count Z rotation
                        // FIXME: find a better way to get a rotation angle. 
                        rotationZ = -((Math.atan(currentX / currentY) * 180 / Math.PI));
                        if (currentX != 0 && currentY != 0) {
                        }
                        if (currentY < 0) {
                            translationY = currentY;
                        } else {
                            translationY = 0;
                        }
                        translationX = currentX;
                    } else if (event.isUp()) {
                        if (canGoBackToCenter) {
                            translationY = 0;
                            translationX = 0;
                            rotationZ = 0;
                        } else {
                            isDraged = false;
                        }
                    }
                }
            }
            // Center should be below all leafs -> it is on top of all
            // other images 
            ImageView {
                id: chamomileCenter
                imageSource: "asset:///images/chamomile_center.png"
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 384
                    positionY: 360
                }
            }
        }
    }
}
