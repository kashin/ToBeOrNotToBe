import bb.cascades 1.0

Container {
    id: flowerContainer
    property string lovesMeText: qsTr("He/She Loves Me")
    property bool lovesMe: true
    //workaround since there is no lovesMeTextChanged signal by default
    signal lovesMeTextChanged(string text)
    function resetFlower() {
        // remove all leafs and a center and recreate them. This call also frees up memory
        flowerContainer.removeAll();

        lovesMe = true;
        lovesMeText = qsTr("He/She Loves Me");
        var rotationAngle = 15;
        // not less then 360/rotationAngle - 1 leafs should be on the screen to get 'full' flower (360 degrees) :)
        var leafsCount = Math.ceil(Math.random() * 12) + (360/rotationAngle - 1);

        var i = 0;
        var xMaximum = 135;
        var yMaximum = 135;
        var xDiff = 4*xMaximum/(360/rotationAngle);
        var yDiff = 4*yMaximum/(360/rotationAngle);
        var xTranslation = -xDiff;
        var yTranslation = -yMaximum - yDiff;
        while (i < leafsCount) {
            console.log("i = " + i);
            var createdLeaf = leafComponent.createObject(parent);
            flowerContainer.add(createdLeaf);
            createdLeaf.leafIsGone.connect(flowerContainer.onLeafIsGone);

            xTranslation = Math.sin(rotationAngle * i * Math.PI /180) * xMaximum;
            if (xTranslation >= xMaximum) {
                xTranslation = xMaximum;
            } else if (xTranslation <= -xMaximum) {
                xTranslation = -xMaximum;
            }
            createdLeaf.initialTranslationX = xTranslation ;
            console.log("X translation = " + xTranslation);

            yTranslation = Math.cos(rotationAngle * i * Math.PI /180) * (-yMaximum);


            if (yTranslation >= yMaximum) {
                yTranslation = yMaximum;
            } else if (yTranslation <= -yMaximum) {
                yTranslation = -yMaximum;
            }
            createdLeaf.initialTranslationY = yTranslation ;
            console.log("Y translation = " + yTranslation);

            createdLeaf.initialRotation = rotationAngle*i;
            i++;
        } // while

        // adding center as the last view, because it should be shown on top of all other images (leafs).
        var createdCenter = chamomileCenterComponent.createObject(parent);
        flowerContainer.add(createdCenter);
    }
    function onLeafIsGone() {
        lovesMeTextChanged(lovesMeText);
        if (lovesMe) {
            flowerContainer.lovesMeText = qsTr("He/She Loves Me Not");
        } else {
            flowerContainer.lovesMeText = qsTr("He/She Loves Me");
        }
        lovesMe = ! lovesMe;
    }
    layout: DockLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    touchPropagationMode: TouchPropagationMode.PassThrough
    preferredHeight: 768

    attachedObjects: [
        ComponentDefinition {
            id: leafComponent
            source: "Leaf.qml"
        },
        ComponentDefinition {
            id: chamomileCenterComponent
            content: ImageView {
                    id: chamomileCenter
                    imageSource: "asset:///images/chamomile_center.png"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    scalingMethod: ScalingMethod.Fill
                    preferredHeight: 200
                    preferredWidth: 200
                }
        }
    ]
}
