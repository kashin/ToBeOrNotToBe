import bb.cascades 1.0
import bb.multimedia 1.0
import tb.ntb 1.0

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
        touchPropagationMode: TouchPropagationMode.Full
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
            text: qsTr("One More Time")
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
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

                //FIXME: right now MediaPlayer API requires absolute path. Fix it to "asset:///sounds/<file>" as soon as API is fixed.
                media.setSourceUrl( applicationSettings.value("flowerVoice",
                                   "/accounts/1000/appdata/com.example.ToBeOrNotToBe.testDev_BeOrNotToBe121b515f/app/native/assets/sounds/flowerDefaultVoice.WAV") );
                media.play();
            }
        }
    }
    onCreationCompleted: {
        resetFlower();
    }
    attachedObjects: [
            Settings {
                id: applicationSettings
            },
            MediaPlayer {
                id: media
        }
    ]
}
