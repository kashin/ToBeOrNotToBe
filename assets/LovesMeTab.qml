import bb.cascades 1.0

Page {
    id: lovesMeTab
    function resetFlower() {
        infoLabel.text = qsTr("Loves Me Or Not?");
        flower.resetFlower();
    }
    actions: [
        ActionItem {
            title: qsTr("Reset image")
            onTriggered: {
                lovesMeTab.resetFlower();
            }
        }
    ]
    // main container of the page
    Container {
        touchPropagationMode: TouchPropagationMode.PassThrough
        layout: StackLayout {
        }
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Loves Me Or Not")
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
            }
        }
        Button {
            text: qsTr("resetFlower")
            onClicked: {
                lovesMeTab.resetFlower();
            }
        }
        Divider {
        }
        Label {
            id: infoLabel
            horizontalAlignment: HorizontalAlignment.Center
            text: qsTr("Loves Me Or Not?")
            textStyle {
                base: SystemDefaults.TextStyles.BigText
            }
        }
        Flower {
            id: flower
            onLovesMeTextChanged: {
                infoLabel.text = text;
            }
        }
    }
    onCreationCompleted: {
        resetFlower();
    }
}
