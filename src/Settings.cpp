#include "Settings.h"

Settings::Settings(QObject* parent)
: QSettings(parent)
{
}

void Settings::setValue(const QString& key, const QVariant& value)
{
	QSettings settings;
	settings.setValue(key, value);
}

QVariant Settings::value(const QString & key, const QVariant & defaultValue) const
{
	QSettings settings;
	return settings.value(key, defaultValue);
}
