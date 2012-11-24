import bb.cascades 1.0
import tb.ntb 1.0

Sheet {
    id: settingsSheet

    function updateSettings() {
        muteButton.checked = applicationSettings.mute
    }

    content: Page {
        titleBar: TitleBar {
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    settingsSheet.close();
                }
            }
        }

        Container {
            Label {
                text: qsTr("Flower's sample voice")
            }
            ToggleButton {
                id: flowerVoiceToggle
                checked: applicationSettings.useDefaultFlowerVoice
                onCheckedChanged: {
                    if (checked) {
                         applicationSettings.useDefaultFlowerVoice = true;
                    } else {
                        if (flowerVoicesDropDown.selectedValue) {
                            applicationSettings.useDefaultFlowerVoice = false;
                            applicationSettings.flowerVoice = flowerVoicesDropDown.selectedValue;
                        }
                    }
                }
            }
            DropDown {
                id: flowerVoicesDropDown
                title: "disabled for now"
                visible: !flowerVoiceToggle.checked
                options: [
                    Option {
                        value: "not supported"
                        text: "not supported"
                    }
                ]
            }
            Divider {
            }
            CheckBox {
                id: muteButton
                text: qsTr("Mute sounds")
                checked: applicationSettings.mute
                onCheckedChanged: {
                    applicationSettings.mute = checked
                }
            }
            Divider {
            }
        } // Container

        attachedObjects: [
            Settings {
                id: applicationSettings
            }
        ]
    } // Page
}

