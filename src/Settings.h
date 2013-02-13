#ifndef TOBEORNOTTOBE_SETTINGS
#define TOBEORNOTTOBE_SETTINGS

#include <QSettings>

/**
 * Class Settings
 */
class Settings : public QSettings
{
	Q_OBJECT
public:
	/**
	 *  If this property is set to true then all sounds in the application are turned off.
	 *  Otherwise, sounds should be turned on.
	 */
	Q_PROPERTY( bool mute READ mute WRITE setMute NOTIFY muteChanged )
	/**
	 *  Shows should we use default voice samples for the flower tab ot not.
	 *  true if we should use voice samples and false otherwise.
	 *  By default this property is set to true
	 */
	Q_PROPERTY( bool useDefaultFlowerVoice READ useDefaultFlowerVoice WRITE setUseDefaultFlowerVoice NOTIFY useDefaultFlowerVoiceChanged )

	/**
	 *  Contains a path to the flower's tab default voice.
	 *  This property is read-only property.
	 */
	Q_PROPERTY( QString flowerVoiceDefault READ flowerVoiceDefault )

	/**
	 *  Contains a path to the flower's tab voice.
	 */
	Q_PROPERTY( QString flowerVoice READ flowerVoice WRITE setFlowerVoice NOTIFY flowerVoiceChanged )

	/**
	 *  Contains maximum leaf's count.
	 */
	Q_PROPERTY( int leafsCount READ leafsCount WRITE setLeafsCount NOTIFY leafsCountChanged )

	/**
	 * used for Magic Ball demo. Simple limitation.
	 */
	Q_PROPERTY( int ballTryCountLeft READ ballTryCountLeft WRITE setBallTryCountLeft NOTIFY ballTryCountLeftChanged )

public:
	Settings(QObject * parent = 0);

public slots:
	void setValue(const QString & key, const QVariant & value);
	QVariant value(const QString & key, const QVariant & defaultValue = QVariant()) const;

	void setMute(bool newMute);
	bool mute();

	void setUseDefaultFlowerVoice(bool useDefault);
	bool useDefaultFlowerVoice();

	QString flowerVoiceDefault();

	void setFlowerVoice(const QString& newFlowerVoice);
	QString flowerVoice();

	int leafsCount();
	void setLeafsCount(int newLeafsCount);

	int ballTryCountLeft();
	void setBallTryCountLeft(int newBallTryCountLeft);

	signals:
    void muteChanged(bool newMute);
    void useDefaultFlowerVoiceChanged(bool newUseDefaultFlowerVoice);
    void flowerVoiceChanged(QString newflowerVoice);
    void leafsCountChanged(int newLeafsCount);
    void ballTryCountLeftChanged(int newBallTryCountLeft);
};

#endif // TOBEORNOTTOBE_SETTINGS
