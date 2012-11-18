#ifndef TOBEORNOTTOBE_SETTINGS
#define TOBEORNOTTOBE_SETTINGS

#include <QSettings>

/**
 * Class
 */
class Settings : public QSettings
{
	Q_OBJECT
public:
	Settings(QObject * parent = 0);
public slots:
	void setValue(const QString & key, const QVariant & value);
	QVariant value(const QString & key, const QVariant & defaultValue = QVariant()) const;
};

#endif // TOBEORNOTTOBE_SETTINGS
