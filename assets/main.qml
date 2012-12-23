import bb.cascades 1.0
import tb.ntb 1.0

TabbedPane {
    
    showTabsOnActionBar: true
    activeTab: flowerTab
// Menu
    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                id: muteAction
                imageSource: "asset:///images/sounds_on.png"
                title: qsTr("Sounds on")

                function updateSoundsAction() {
                    if (applicationSettings.mute) {
                        imageSource = "asset:///images/sounds_off.png";
                        title = qsTr("Sounds off");
                    } else {
                        imageSource = "asset:///images/sounds_on.png";
                        title = qsTr("Sounds on");
                    }
                }
                onTriggered: {
                    applicationSettings.mute = !applicationSettings.mute;
                    updateSoundsAction();
                }
                onCreationCompleted: {
                    updateSoundsAction();
                }
            }
        ]
        helpAction: HelpActionItem {
            id: aboutHelpAction
            title: qsTr("About")
            property variant createdSheet: 0

            function onSheetClosed() {
                delete createdSheet;
                createdSheet = 0;
            }

            onTriggered: {
                createdSheet = aboutSheetDef.createObject(parent);
                createdSheet.closed.connect(onSheetClosed);
                createdSheet.open();
            }
        }
        settingsAction: SettingsActionItem {
                            id: settingsAction
                            property variant createdSheet: 0
                            function onSheetClosed() {
                                delete createdSheet;
                                createdSheet = 0;
                            }

                            onTriggered: {
                                createdSheet = settingsSheetDef.createObject(parent);
                                createdSheet.closed.connect(onSheetClosed);
                                createdSheet.open();
                            }
                        }
        attachedObjects: [
            // Workaround for http://supportforums.blackberry.com/t5/Cascades-Development/Beta-4-Application-Menu-Issue/td-p/2010717
            ComponentDefinition {
                id: aboutSheetDef
                content: Sheet {
                    id: aboutSheet
                    peekEnabled: false
                    content: Page {
                        Container {
                            id: aboutContainer
                            background: Color.Black
                            AboutWebView {
                            }
                            Button {
                                text: "Close"
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                onClicked: {
                                    aboutSheet.close();
                                }
                            }
                        } // aboutContainer
                    } // Page
                } // aboutSheet
            }, // ComponentDefinition
            ComponentDefinition {
                id: settingsSheetDef
                content: SettingsSheet {
                    id: settingsSheet
                    onClosed: {
                        muteAction.updateSoundsAction();
                    }
                }
            },
            Settings {
                id: applicationSettings
            }
        ]
    }

//Tabs
    Tab {
        id: flowerTab
        title: qsTr("Loves Me Or Not")
        image: flowerIcon.image
        LovesMeTab {
            id: lovesMeTab
        }
        attachedObjects: [
            ImagePaintDefinition {
                id: flowerIcon
                repeatPattern: RepeatPattern.Fill
                imageSource: "asset:///images/flower_icon.png"
            }
        ]
    }
    Tab {
        id: ballTab
        attachedObjects: [
            ComponentDefinition {
                id: ballTabDef
                source: "asset:///Ball/BallTab.qml"
            }
        ]
        title: qsTr("Magic ball")
        imageSource: "asset:///images/ball_icon.png"
        onTriggered: {
            if (content == undefined) {
                var ballPageCreated = ballTabDef.createObject(parent);
                content = ballPageCreated;
            }
        }
    }
    Tab {
        id: askRandomTab
        title: qsTr("Ask Random")
        imageSource: "asset:///images/ask_me_icon.png"
        onTriggered: {
            if (content == undefined) {
                var createdTab = askRandomTabDef.createObject(parent);
                content = createdTab;
            }
        }
        attachedObjects: [
            ComponentDefinition {
                id: askRandomTabDef
                source: "asset:///AskRandom/AskRandomTab.qml"
            }
        ]
    }
}
