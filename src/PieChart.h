/*
 * PieChart.h
 *
 *  Created on: 09.11.2012
 *      Author: golovinskaya.a
 */

#ifndef PIECHART_H_
#define PIECHART_H_

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/TabbedPane>
#include <bb/cascades/Button>
#include <bb/cascades/Page>
#include <bb/cascades/Container>
#include <bb/cascades/Color>

using namespace bb::cascades;

namespace bb { namespace cascades { class Application; }}

class PieChart : public QObject
{
	 Q_OBJECT
	 Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)
	        public:
	            PieChart(bb::cascades::Application *app);
	            virtual ~PieChart() {}
	        // By using Q_INVOKABLE we can call it from qml
	            Q_INVOKABLE void injectContainer();
	            Q_INVOKABLE void reset();

	            int value();
	            void setValue(int i);
	        signals:
	            void valueChanged(int);
	        public slots:
	            void btnClickSlot();
	        private:
	            Page *appPage;
	            Container *mRootContainer;
	            int miValue;
};

#endif /* PIECHART_H_ */
