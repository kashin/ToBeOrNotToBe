#include "Settings.h"

Settings::Settings(QObject* parent)
: QSettings(parent)
{
}

void Settings::setValue(const QString& key, const QVariant& value)
{
	QSettings::setValue(key, value);
}

QVariant Settings::value(const QString & key, const QVariant & defaultValue) const
{
	return QSettings::value(key, defaultValue);
}

void Settings::setMute(bool newMute)
{
	if (newMute != mute()) {
		setValue("mute", newMute);
		emit muteChanged(newMute);
	}
}
bool Settings::mute()
{
	return value("mute", false).toBool();
}

void Settings::setUseDefaultFlowerVoice(bool useDefault)
{
	if (useDefault != useDefaultFlowerVoice()) {
		setValue("useDefaultFlowerVoice", useDefault);
		emit useDefaultFlowerVoiceChanged(useDefault);
	}
}

bool Settings::useDefaultFlowerVoice()
{
	return value("useDefaultFlowerVoice", true).toBool();
}

QString Settings::flowerVoiceDefault()
{
    //FIXME: right now MediaPlayer API requires absolute path. Fix it to "asset:///sounds/<file>" as soon as API is fixed.
	return "asset:///sounds/flowerDefaultVoice";
}

void Settings::setFlowerVoice(const QString& newFlowerVoice)
{
	if (newFlowerVoice != flowerVoice()) {
		setValue("flowerVoice", newFlowerVoice);
		emit flowerVoiceChanged(newFlowerVoice);
	}
}

QString Settings::flowerVoice()
{
    return value("flowerVoice", "").toString();
}

int Settings::leafsCount()
{
	return value("leafsCount", 25).toInt();
}

void Settings::setLeafsCount(int newLeafsCount)
{
	if (newLeafsCount != leafsCount()) {
		setValue("leafsCount", newLeafsCount);
		emit leafsCountChanged(newLeafsCount);
	}
}

int Settings::ballTryCountLeft()
{
	return value("ballTryCountLeft", 5).toInt();
}

void Settings::setBallTryCountLeft(int /*newBallTryCountLeft*/)
{
	const int current = ballTryCountLeft();
	if (current > 0) {
		setValue("ballTryCountLeft", current - 1);
		emit ballTryCountLeftChanged(current - 1);
	}
}

int Settings::flowerTryCountLeft()
{
	return value("flowerTryCountLeft", 3).toInt();
}

void Settings::setFlowerTryCountLeft(int /*newBallTryCountLeft*/)
{
	const int current = flowerTryCountLeft();
	if (current > 0) {
		setValue("flowerTryCountLeft", current - 1);
		emit flowerTryCountLeftChanged(current - 1);
	}
}
