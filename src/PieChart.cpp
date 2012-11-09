/*
 * PieChart.cpp
 *
 *  Created on: 09.11.2012
 *      Author: golovinskaya.a
 */

#include "PieChart.h"

    PieChart::PieChart(bb::cascades::Application *app) : QObject(app)
    {
        // create scene document from main.qml asset
        // set parent to created document to ensure it exists
        //for the whole application lifetime
        QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
        qml->setContextProperty("injection", this);
        // create root object for the UI
        Page *page = qml->createRootObject<Page>();
        bool success = QObject::connect(page, SIGNAL(btnClickSignal()), this, SLOT(btnClickSlot()));
        Q_ASSERT(success);

        // Indicate that the variable success isn't used in the rest of the app, to
        // prevent a compiler warning
        Q_UNUSED(success);
        // set created root object as a scene
        app->setScene(page);
    }

    void PieChart::btnClickSlot()
    {
	// Do something
		int i = 0;
		i++;
    }

    void PieChart::injectContainer()
    {
        // Creates the container and adds it to the root
        // container in qml
        mRootContainer->add(Container::create()
            .background(Color::Red)
            .preferredSize(200,200)
            .bottomMargin(20)
            .horizontal(HorizontalAlignment::Center));
    }

    int PieChart::value()
    {
        return miValue;
    }

    void PieChart::setValue(int i)
    {
        miValue = i;
        emit valueChanged(miValue);
    }

    void PieChart::reset()
    {
        miValue = 0;
        emit valueChanged(miValue);
    }

