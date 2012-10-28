import bb.cascades 1.0

Container {
    id: flowerContainer
    property alias xPosition: centerLayoutProperties.positionX
    property alias yPosition: centerLayoutProperties.positionY
    property string lovesMeText: qsTr("He/She Loves Me")
    property bool lovesMe: true
    //workaround since there is no lovesMeTextChanged signal by default
    signal lovesMeTextChanged(string text)
    function resetFlower() {
        lovesMe = true;
        lovesMeText = qsTr("He/She Loves Me");
        leaf1.resetLeaf();
        leaf2.resetLeaf();
        leaf3.resetLeaf();
        leaf4.resetLeaf();
        leaf5.resetLeaf();
        leaf6.resetLeaf();
        leaf7.resetLeaf();
        leaf8.resetLeaf();
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
    layout: AbsoluteLayout {
    }
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    preferredWidth: 768
    preferredHeight: 768
    touchPropagationMode: TouchPropagationMode.PassThrough
    //another stupid part, a lot of leafs... since there is no way to create components dynamicaly, yet
    Leaf {
        id: leaf1
        visible: true
        initialRotation: 0
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf1LayoutProperties
            positionX: 400
            positionY: 270
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf2
        visible: true
        initialRotation: 15
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf2LayoutProperties
            positionX: 430
            positionY: 275
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf3
        visible: true
        initialRotation: -15
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf3LayoutProperties
            positionX: 370
            positionY: 275
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf4
        visible: true
        initialRotation: -7
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf4LayoutProperties
            positionX: 385
            positionY: 275
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf5
        visible: true
        initialRotation: -40
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf5LayoutProperties
            positionX: 365
            positionY: 290
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf6
        visible: true
        initialRotation: -65
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf6LayoutProperties
            positionX: 360
            positionY: 310
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf7
        visible: true
        initialRotation: -80
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf7LayoutProperties
            positionX: 350
            positionY: 330
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf8
        visible: true
        initialRotation: -110
        layoutProperties: AbsoluteLayoutProperties {
            id: leaf8LayoutProperties
            positionX: 355
            positionY: 355
        }
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    // Center should be below all leafs -> it is on top of all
    // other images
    ImageView {
        id: chamomileCenter
        imageSource: "asset:///images/chamomile_center.png"
        layoutProperties: AbsoluteLayoutProperties {
            id: centerLayoutProperties
            positionX: 384
            positionY: 360
        }
    }
}
