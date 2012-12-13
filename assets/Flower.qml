import bb.cascades 1.0
import tb.ntb 1.0

Container {
    id: flowerContainer
    property string lovesMeText: ""
    property bool lovesMe: false
    property bool bonusRound: true
    property int bonusLeafsMaxCount: 7
    property int rotationAngle: 17

    function addBonusLeafs() {
        flowerContainer.removeAll();
        // not less then 360/rotationAngle - 1 leafs should be on the screen to get 'full' flower (360 degrees) :)
        var leafsCount = Math.ceil(Math.random() * bonusLeafsMaxCount);

        var i = 0;
        var xMaximum = 170;
        var yMaximum = 170;
        var xDiff = 4*xMaximum/(360/rotationAngle);
        var yDiff = 4*yMaximum/(360/rotationAngle);
        var xTranslation = -xDiff;
        var yTranslation = -yMaximum - yDiff;
        while (i < leafsCount) {
            var createdLeaf = leafComponent.createObject(parent);
            flowerContainer.add(createdLeaf);
            createdLeaf.leafIsGone.connect(flowerContainer.onLeafIsGone);
            createdLeaf.dragStarted.connect(flowerContainer.onDragLeafStarted);
            createdLeaf.dragStoped.connect(flowerContainer.onDragLeafStoped);
            createdLeaf.objectName = "leaf" + i;

            xTranslation = Math.sin(rotationAngle * i * Math.PI /180) * xMaximum;
            if (xTranslation >= xMaximum) {
                xTranslation = xMaximum;
            } else if (xTranslation <= -xMaximum) {
                xTranslation = -xMaximum;
            }
            createdLeaf.initialTranslationX = xTranslation ;

            yTranslation = Math.cos(rotationAngle * i * Math.PI /180) * (-yMaximum);

            if (yTranslation >= yMaximum) {
                yTranslation = yMaximum;
            } else if (yTranslation <= -yMaximum) {
                yTranslation = -yMaximum;
            }
            createdLeaf.initialTranslationY = yTranslation ;

            // initialRotation angle shouldn't be > 360
            createdLeaf.initialRotation = (rotationAngle*i) % 360;
            i++;
        } // while

        // adding center as the last view, because it should be shown on top of all other images (leafs).
        var createdCenter = chamomileCenterComponent.createObject(parent);
        flowerContainer.add(createdCenter);
    }

    function resetFlower() {
        // remove all leafs and a center and recreate them. This call also frees up memory
        flowerContainer.removeAll();

        lovesMe = false;
        bonusRound = true;
        lovesMeText = "";
        // not less then 360/rotationAngle - 1 leafs should be on the screen to get 'full' flower (360 degrees) :)
        var fullFlowerLeafsCount = 360/rotationAngle - 1;
        var leafsCount = Math.ceil(Math.random() * (applicationSettings.leafsCount - fullFlowerLeafsCount)) + fullFlowerLeafsCount;

        var i = 0;
        var xMaximum = 170;
        var yMaximum = 170;
        var xDiff = 4*xMaximum/(360/rotationAngle);
        var yDiff = 4*yMaximum/(360/rotationAngle);
        var xTranslation = -xDiff;
        var yTranslation = -yMaximum - yDiff;
        while (i < leafsCount) {
            var createdLeaf = leafComponent.createObject(parent);
            flowerContainer.add(createdLeaf);
            createdLeaf.leafIsGone.connect(flowerContainer.onLeafIsGone);
            createdLeaf.dragStarted.connect(flowerContainer.onDragLeafStarted);
            createdLeaf.dragStoped.connect(flowerContainer.onDragLeafStoped);
            createdLeaf.objectName = "leaf" + i;

            xTranslation = Math.sin(rotationAngle * i * Math.PI /180) * xMaximum;
            if (xTranslation >= xMaximum) {
                xTranslation = xMaximum;
            } else if (xTranslation <= -xMaximum) {
                xTranslation = -xMaximum;
            }
            createdLeaf.initialTranslationX = xTranslation ;

            yTranslation = Math.cos(rotationAngle * i * Math.PI /180) * (-yMaximum);


            if (yTranslation >= yMaximum) {
                yTranslation = yMaximum;
            } else if (yTranslation <= -yMaximum) {
                yTranslation = -yMaximum;
            }
            createdLeaf.initialTranslationY = yTranslation ;

            // initialRotation angle shouldn't be > 360
            createdLeaf.initialRotation = (rotationAngle*i) % 360;
            i++;
        } // while

        // adding center as the last view, because it should be shown on top of all other images (leafs).
        var createdCenter = chamomileCenterComponent.createObject(parent);
        flowerContainer.add(createdCenter);
    }

    function onLeafIsGone(leaf) {
        console.log("onLeafIsGone")
        if (flowerContainer.lovesMe) {
            flowerContainer.lovesMeText = qsTr("Loves Me Not");
        } else {
            flowerContainer.lovesMeText = qsTr("Loves Me");
        }
        flowerContainer.lovesMe = !flowerContainer.lovesMe;
        flowerContainer.remove(leaf);
    }

    function onDragLeafStarted(leaf) {
        for (var j = 0 ; j < flowerContainer.count() - 1; j++) {
            var leafObject = flowerContainer.at(j);
            if (leafObject.objectName != leaf) {
                leafObject.anotherLeafDragStarted = true;
                leafObject.touchPropagationMode = TouchPropagationMode.PassThrough;
            }
        }
    }

    function onDragLeafStoped(leaf) {
        for (var j = 0 ; j < flowerContainer.count() - 1; j++) {
            var leafObject = flowerContainer.at(j);
            if (leafObject.objectName != leaf) {
                leafObject.anotherLeafDragStarted = false;
                leafObject.touchPropagationMode = TouchPropagationMode.Full;
            }
        }
    }

    layout: DockLayout {
    }

    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    touchPropagationMode: TouchPropagationMode.Full
    preferredHeight: 768

    onControlRemoved: {
        // adding some 'bonus leafs' if lovesMe == false, let's give users another chance :)
        console.log("onControlRemoved:" + flowerContainer.count());
        if (flowerContainer.count() == 1 && flowerContainer.bonusRound && !flowerContainer.lovesMe) {
            console.log("onControlRemoved2:");
            moreLeafsSheet.open()
            flowerContainer.bonusRound = false;
        }
    }

    attachedObjects: [
        Settings {
            id: applicationSettings
        },
        ComponentDefinition {
            id: leafComponent
            source: "Leaf.qml"
        },
        ComponentDefinition {
            id: chamomileCenterComponent
            content: ImageView {
                    id: chamomileCenter
                    touchPropagationMode: TouchPropagationMode.PassThrough
                    imageSource: "asset:///images/chamomile_center.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    scalingMethod: ScalingMethod.Fill
                    preferredHeight: 270
                    preferredWidth: 270
                }
        },
        Sheet {
            id: moreLeafsSheet
            content: Page {
                content: Container {
                    Label {
                        multiline: true
                        text: qsTr("You are lucky!\n You found few more leafs on this flower")
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        textStyle {
                            textAlign: TextAlign.Center
                            base: SystemDefaults.TextStyles.BigText
                        }
                    }
                    Button {
                        text: qsTr("Ok")
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        onClicked: {
                            moreLeafsSheet.close();
                        }
                    }
                } // Container
            }
            onClosed: {
                flowerContainer.addBonusLeafs();
            }
        }// Sheet
    ]
}
