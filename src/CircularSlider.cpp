/*
 * CircularSlider.cpp
 *
 *  Created on: 05.12.2012
 *      Author: golovinskaya.a
 */
#include "CircularSlider.hpp"

#include <bb/cascades/AbsoluteLayout>
#include <bb/cascades/AbsoluteLayoutProperties>
#include <bb/cascades/DockLayout>
#include <iostream>
#include <math.h>

#define PI 3.141592653589793

CircularSlider::CircularSlider() {
	// In the constructor, we create a root container
	//that uses an AbsoluteLayout and we create the circular
	//image that serves as the slider track.

	// Create a root container with an AbsoluteLayout.
	    mRootContainer = new Container();
	    mRootContainer->setLayout(new AbsoluteLayout());

	    // Create the slider track image.
	    mTrackImage = ImageView::create().image(
	            QUrl("asset:///images/slider_track.png"));

	    // Create the handle container and two images, one for
	    // active state and one for inactive.
	    mHandleContainer = Container::create()
	            .layout(new DockLayout());

	    // Disable implicit animations for the handle container so that
	    // the handle doesn't jump when it's being dragged.
	    mHandleImplicitAnimationController =
	            ImplicitAnimationController::create(mHandleContainer)
	                    .enabled(false);

	    // Load the handle images
	    mHandleOn = Image(QUrl("asset:///images/handle_pressed.png"));
	    mHandleOff = Image(QUrl("asset:///images/handle_inactive.png"));

	    // Create the image view for the handle using the image for
	    // the inactive handle
	    mHandle = ImageView::create().image(mHandleOff)
	            .horizontal(HorizontalAlignment::Right)
	            .vertical(VerticalAlignment::Center);

	    // Finally, we add everything to the root container and set
	    //the root control for the application.

	    // Add the handle image to the to handle container
	    // and add everything to the root container
	    mHandleContainer->add(mHandle);
	    mRootContainer->add(mTrackImage);
	    mRootContainer->add(mHandleContainer);

	    // Set the root of the custom control.
	    setRoot(mRootContainer);

	   bool res = connect(this, SIGNAL(preferredHeightChanged(float)), this, SLOT(onHeightChanged(float)));
	   Q_ASSERT(res);
	   Q_UNUSED(res);

	   bool res2 = connect(this, SIGNAL(preferredWidthChanged(float)), this, SLOT(onWidthChanged(float)));
	   Q_ASSERT(res2);
	   Q_UNUSED(res2);

	   bool res3 = connect(mRootContainer, SIGNAL(touch(bb::cascades::TouchEvent *)),
	       this, SLOT(onSliderHandleTouched(bb::cascades::TouchEvent *)));

	   Q_ASSERT(res3);
	   Q_UNUSED(res3);
	        // Set the initial size.
	   mWidth = 600;
	   mHeight = 600;
	   setPreferredSize(mWidth, mHeight);
}

CircularSlider::~CircularSlider() {
	// TODO Auto-generated destructor stub
}

// Get the value of the slider.
float CircularSlider::value() const
{
    return mValue;
}

// Set the value of the slider.
void CircularSlider::setValue(float value)
{
   // if (mValue != value)
   // {
        mValue = value;
        emit valueChanged(mValue);
   // }
}

void CircularSlider::onSizeChanged()
{
    // Define the center of the circle.
    mCenterX = mWidth / 2;
    mCenterY = mHeight / 2;
    mRadiusCircle = mWidth - mCenterX;

    // Set the root container to the new size.
    mRootContainer->setPreferredSize(mWidth, mHeight);

    // Set the track image to be slightly smaller than the root.
    mTrackImage->setPreferredSize(mWidth * 0.85, mHeight * 0.85);

    // Set the handle image and container to be much smaller.
    mHandle->setPreferredSize(0.2 * mWidth, 0.2 * mHeight);
    mHandleContainer->setPreferredSize(mWidth, 0.2 * mHeight);

    // Transform the handle container along its y axis to move it
    // into the correct position.
    mHandleContainer->setTranslationY((mHeight - 0.2 * mHeight) / 2);

    // Transform the position of the track image to the correct
    // position.
    mTrackImage->setTranslation((mWidth - 0.85 * mWidth) / 2,
            (mHeight - 0.85 * mHeight) / 2);

    // Clear the circumference points for the circle
    // and reinitialize them to reflect the new size.
    pointsOnCircumference.clear();

    for (int angle = 0; angle < 360; angle++) {
        float x = mCenterX + (mRadiusCircle) * cos(angle * PI / 180);
        float y = mCenterY + (mRadiusCircle) * sin(angle * PI / 180);
        pointsOnCircumference.push_back(make_pair(x, y));
    }
}

void CircularSlider::onSliderHandleTouched(TouchEvent* pTouchEvent)
{
    // Change to the active handle image if isDown()
    if (pTouchEvent->isDown()) {
        mHandle->setImage(mHandleOn);
    // Change to the inactive handle image if isUp()
    } else if (pTouchEvent->isUp()) {
        mHandle->setImage(mHandleOff);
    // Change the position of the slider handle if isMove()
    }

    /*if (pTouchEvent->isMove()) {*/
        processRawCoordinates(pTouchEvent->localX(),
                pTouchEvent->localY());
    /*}*/
}

void CircularSlider::processRawCoordinates(float touchX, float touchY) {

    // Determine the distance from the center to the touch point.
    float distanceFromCenterToTouchPoint = sqrt(
            (touchX - mCenterX) * (touchX - mCenterX)
                    + (touchY - mCenterY) * (touchY - mCenterY));

    // Determine whether the touch point is outside the center of
    // the circle and in the valid touch area.
    if (distanceFromCenterToTouchPoint >= 0.3 * mRadiusCircle
            && distanceFromCenterToTouchPoint <= mRadiusCircle) {

    	// The minimum distance from the touch.
    	float minDistanceFromTouch = INT_MAX;

    	// Measure the distance from the touch to the circumference
    	// for each point on the circle and store the X and Y
    	// coordinates for the shortest distance.
    	for (float i = 0; i < pointsOnCircumference.size(); i++) {
    	    float x = pointsOnCircumference[i].first;
    	    float y = pointsOnCircumference[i].second;
    	    float distanceFromTouch = sqrt(
    	            (x - touchX) * (x - touchX)
    	                    + (y - touchY) * (y - touchY));
    	    if (distanceFromTouch < minDistanceFromTouch) {
    	        minDistanceFromTouch = distanceFromTouch;
    	        // The angle to rotate the handle container once moved
    	        mAngle = i;
    	    }
    	}
    	// Rotate the handle container along its Z-axis.
    	        if (mAngle != mrevAngle) {
    	            mHandleContainer->setRotationZ(mAngle);
    	            // Our slider has a new value, and we want our QML to know
    	            emit valueChanged(mAngle);
    	            mrevAngle = mAngle;
    	        }
    	    }
    	}

void CircularSlider::onWidthChanged(float width)
{
}

void CircularSlider::onHeightChanged(float height)
{
}

