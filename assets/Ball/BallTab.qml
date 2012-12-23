import bb.cascades 1.0
import tb.ntb 1.0

Page {

    titleBar: TitleBar {
        appearance: TitleBarAppearance.Plain
        title: qsTr("Ask me...")
    }
    id: magicBall

    Container {
        id: ballContainer
        background: Color.DarkBlue
        layout: DockLayout {}

        function updateAnswerText() {
        }

        function fadeInAnwser() {
            updateAnswerText();
            firstLabelFadeAnim.fromOpacity = 0
            firstLabelFadeAnim.toOpacity = 1
            firstLabelFadeAnim.duration = 300
            secondLabelFadeAnim.fromOpacity = 0
            secondLabelFadeAnim.toOpacity = 1
            secondLabelFadeAnim.duration = 500
            thirdLabelFadeAnim.fromOpacity = 0
            thirdLabelFadeAnim.toOpacity = 1
            thirdLabelFadeAnim.duration = 700
            firstLabelFadeAnim.play()
            secondLabelFadeAnim.play()
            thirdLabelFadeAnim.play()
        }

        function fadeOutAnwser() {
            firstLabelFadeAnim.fromOpacity = 1
            firstLabelFadeAnim.toOpacity = 0
            firstLabelFadeAnim.duration = 700
            secondLabelFadeAnim.fromOpacity = 1
            secondLabelFadeAnim.toOpacity = 0
            secondLabelFadeAnim.duration = 500
            thirdLabelFadeAnim.fromOpacity = 1
            thirdLabelFadeAnim.toOpacity = 0
            thirdLabelFadeAnim.duration = 300
            firstLabelFadeAnim.play()
            secondLabelFadeAnim.play()
            thirdLabelFadeAnim.play()
        }

        Ball {
            id: ball
            onShowText: {
                ballContainer.fadeInAnwser()
            }
            onHideText: {
                ballContainer.fadeOutAnwser()
            }
        }
        Label {
            id: firstLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            text: qsTr("some long")
            textStyle {
                textAlign: TextAlign.Center
            }
            preferredWidth: 130
            preferredHeight: 70
            translationY: -70
            opacity: 0
            animations: [
                FadeTransition {
                    id: firstLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 300
                }
            ]
            onOpacityChanged: {
                if (opacity == 0) {
                    ball.isShowingText = false
                    ball.ignoreTaps = false
                    ball.startAnimation()
                }
            }
        }
        Label {
            id: secondLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            text: qsTr("text")
            textStyle {
                textAlign: TextAlign.Center
            }
            preferredWidth: 130
            preferredHeight: 70
            opacity: 0
            animations: [
                FadeTransition {
                    id: secondLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 500
                }
            ]
        }
        Label {
            id: thirdLabel
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            text: qsTr("is here")
            preferredWidth: 130
            preferredHeight: 70
            textStyle {
                textAlign: TextAlign.Center
            }
            translationY: 70
            opacity: 0
            animations: [
                FadeTransition {
                    id: thirdLabelFadeAnim
                    fromOpacity: 0
                    toOpacity: 1
                    duration: 700
                }
            ]
            onOpacityChanged: {
                if (opacity == 1) {
                    ball.isShowingText = true
                    ball.ignoreTaps = false
                }
            }
        }// Label
    }
}

