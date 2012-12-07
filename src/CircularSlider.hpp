/*
 * CircularSlider.h
 *
 *  Created on: 05.12.2012
 *      Author: golovinskaya.a
 */

#ifndef CIRCULARSLIDER_H_
#define CIRCULARSLIDER_H_

#include <bb/cascades/CustomControl>
#include <bb/cascades/Container>
#include <bb/cascades/TouchEvent>
#include <bb/cascades/ImageView>
#include <bb/cascades/Image>
#include <bb/cascades/ImplicitAnimationController>
#include <bb/cascades/Label>

#include <QObject>
#include <vector>

using namespace std;
using namespace bb::cascades;

class CircularSlider: public CustomControl {

    Q_OBJECT
    Q_PROPERTY(float value READ value WRITE setValue
            NOTIFY valueChanged FINAL)

public:
    CircularSlider();
    virtual ~CircularSlider();
    float value() const;
    void setValue(float value);
    void innerCircle(QVariant innerCircle);

Q_SIGNALS:
    void valueChanged(float value);

private slots:
    void onSliderHandleTouched(bb::cascades::TouchEvent *pTouchEvent);

private slots:
    void onWidthChanged(float width);
    void onHeightChanged(float height);

private:
    void onSizeChanged();
    void processRawCoordinates(float inX, float inY);

    Container *mRootContainer;
    ImageView *mTrackImage;

    float mWidth;
    float mHeight;
    float mrevAngle;

    float mCenterX;
    float mCenterY;
    float mRadiusCircle;

    Image mHandleOn;
    Image mHandleOff;
    ImageView *mHandle;
    Container *mHandleContainer;

    vector<pair<int, int> > pointsOnCircumference;
    float mAngle;
    float mValue;
    ImplicitAnimationController mHandleImplicitAnimationController;
};

#endif /* CIRCULARSLIDER_H_ */
