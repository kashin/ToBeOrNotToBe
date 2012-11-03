import bb.cascades 1.0

Container {
    id: flowerContainer
    property string lovesMeText: qsTr("He/She Loves Me")
    property bool lovesMe: true
    //workaround since there is no lovesMeTextChanged signal by default
    signal lovesMeTextChanged(string text)
    function resetFlower() {
        lovesMe = true;
        lovesMeText = qsTr("He/She Loves Me");
        leaf1.resetLeaf();
        leaf2.resetLeaf();
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
    preferredHeight: 600
    touchPropagationMode: TouchPropagationMode.PassThrough
    //FIXME: add dynamic creation
    Leaf {
        id: leaf1
        visible: true
        initialRotation: 0
        initialTranslationX: 0
        initialTranslationY: -30
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    Leaf {
        id: leaf2
        visible: true
        initialRotation: 15
        initialTranslationX: 20
        initialTranslationY: -30
        onCreationCompleted: {
            leafIsGone.connect(flowerContainer.onLeafIsGone);
        }
    }
    // Center should be below all leafs -> it is on top of all
    // other images
    ImageView {
        id: chamomileCenter
        imageSource: "asset:///images/chamomile_center.png"
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
    }
}
