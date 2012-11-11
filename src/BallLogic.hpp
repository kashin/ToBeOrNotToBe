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

class BallLogic : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    explicit BallLogic(QObject* parent = 0);
    virtual ~BallLogic();
    Q_INVOKABLE int value();
    Q_INVOKABLE void setValue(int i);

signals:
    void valueChanged(int);

private:
	int miValue;
};

#endif /* BALLLOGIC_H_ */
