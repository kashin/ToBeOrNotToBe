/*
 * BallLogic.h
 *
 *  Created on: 08.11.2012
 *      Author: golovinskaya.a
 */

#ifndef BALLLOGIC_H_
#define BALLLOGIC_H_

#include <QObject>
#include <QString>
#include <bb/cascades/CustomControl>

//using namespace bb::cascades;
//namespace bb { namespace cascades { class Application; }}

class BallLogic : public bb::cascades::CustomControl
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    int value();
    void setValue(int i);

signals:
    void valueChanged(int);
private:
	int miValue;
};

#endif /* BALLLOGIC_H_ */
