import bb.cascades 1.0
import tb.ntb 1.0

Page {
    id: lovesMeTab
    actionBarVisibility: ChromeVisibility.Overlay
    inputRoute.primaryKeyTarget: true
    function resetFlower() {
        flower.resetFlower();
        if (applicationSettings.flowerTryCountLeft <= 0) {
            infoLabel.text = qsTr("No more attempts.");
        } else {
            infoLabel.text = qsTr("Loves Me Or Not?");
        }
    }
    actions: [
        ActionItem {
            title: qsTr("Try again")
            imageSource: "asset:///images/flower_icon.png"
            onTriggered: {
                lovesMeTab.resetFlower()
            }
            shortcuts: [
                Shortcut {
                    id: resetShortcut
                    key: "r"
                    onTriggered: {
                        lovesMeTab.resetFlower()
                    }
                }
            ]
        }
    ]
    shortcuts: [
        Shortcut {
            id: takeLeaf
            key: "Space"
            onTriggered: {
                flower.takeOneLeaf()
            }
        }
    ]
    // main container of the page
    Container {
        touchPropagationMode: TouchPropagationMode.Full
        layout: StackLayout {
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
                infoLabel.text = flower.lovesMeText;
                var source = lovesMe ? "asset:///sounds/leaf_loves.wav" :
                                       "asset:///sounds/leaf_loves_not.wav"
                player.muteSound = !applicationSettings.useDefaultFlowerVoice;
                player.setSourceUrl( source );
                player.playSound();
            }
            onFlowerCenterTapedChanged: {
                if (lovesMeTab.actionBarVisibility == ChromeVisibility.Visible) {
                    lovesMeTab.actionBarVisibility = ChromeVisibility.Hidden
                } else {
                    lovesMeTab.actionBarVisibility = ChromeVisibility.Visible
                }
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
            SoundPlayer {
                id: player
                muteSound: !applicationSettings.useDefaultFlowerVoice
            }
    ]
}
