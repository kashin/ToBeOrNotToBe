import bb.cascades 1.0

ImageView {
    id: ballView

    property bool isShowingText: false
    property bool ignoreTaps: false

    signal showText()
    signal hideText()
    
    function startAnimation() {
        // start of stupid hack. Otherwise, for some reason animation is not started
        var source = ballView.imageSource
        ballView.imageSource = ""
        ballView.imageSource = source
        // end of stupid hack
        ballAnimator.start()
        ignoreTaps = false
    }
    
    function stopAnimation() {
        ballAnimator.stopAt(1,2)
        ignoreTaps = true
    }

    imageSource: "asset:///images/1.gif"
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    preferredHeight: 700
    preferredWidth: 700

    attachedObjects: [
        ImageAnimator {
            id: ballAnimator
            property bool isInitialized: false
            animatedImage: ballView.image
            onRunningChanged: {
                if(!running && isInitialized) {
                    ballView.showText()
                    ignoreTaps = true
                }
            }
        }
    ]
    gestureHandlers: [
        TapHandler {
            onTapped: {
                if(ballView.ignoreTaps) {
                    return;
                }
                if (isShowingText) {
                    ballView.hideText()
                    ignoreTaps = true
                    return;
                }
                if (ballAnimator.playing) {
                    stopAnimation()
                } else {
                    startAnimation()
                }
            }
        }
    ]
    onCreationCompleted: {
        ballAnimator.isInitialized = true
    }
} // ImageView