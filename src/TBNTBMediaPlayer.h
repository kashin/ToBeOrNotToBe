#ifndef TBNTBMEDIAPLAYER_H
#define TBNTBMEDIAPLAYER_H

#include <bb/multimedia/MediaPlayer.hpp>
#include "Settings.h"

class TBNTBMediaPlayer: public bb::multimedia::MediaPlayer
{
	Q_OBJECT
public:
    /**
     * This property will help you to turn-off sound in the @c TBNTMediaPlayer object
     * when other sounds are turned on in the application. Example is can be found in LovesMeTab.qml
     *
     */
    Q_PROPERTY( bool muteSound READ muteSound WRITE setMuteSound NOTIFY muteSoundChanged )

    Q_PROPERTY( int repeatSoundMode READ repeatSoundMode WRITE setRepeatSoundMode NOTIFY repeatModeSoundChanged )

    explicit TBNTBMediaPlayer(QObject * parent = 0);
    virtual ~TBNTBMediaPlayer();

    Q_INVOKABLE void playSound();

    Q_INVOKABLE bool muteSound();

    Q_INVOKABLE int repeatSoundMode();

public slots:
    void setMuteSound(bool newMuteSound);

    void setRepeatSoundMode(int newRepeatSoundMode);

signals:
    void muteSoundChanged(bool newMuteSound);
    void repeatModeSoundChanged(int newRepeatSoundMode);

private:
    bool mMuteSound;
    Settings mSettings;
};

#endif // TBNTBMEDIAPLAYER_H
