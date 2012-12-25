#include "TBNTBMediaPlayer.h"
#include <bb/multimedia/RepeatMode>
#include <qdebug.h>

TBNTBMediaPlayer::TBNTBMediaPlayer(QObject * parent)
: bb::multimedia::MediaPlayer(parent),
  mMuteSound(false),
  mSettings(this)
{
	connect(this, SIGNAL(repeatModeChanged(bb::multimedia::RepeatMode::Type)),
			this, SIGNAL(repeatModeSoundChanged(int)));
}

TBNTBMediaPlayer::~TBNTBMediaPlayer()
{
}

void TBNTBMediaPlayer::playSound()
{
 if (!mSettings.mute() && !mMuteSound) {
	 bb::multimedia::MediaPlayer::play();
 } else {
	 qDebug() << "this sound is muted: mute = " << mSettings.mute() << "muteSound = " << mMuteSound;
 }
}

bool TBNTBMediaPlayer::muteSound()
{
  return mMuteSound;
}

void TBNTBMediaPlayer::setMuteSound(bool newMuteSound)
{
  if (mMuteSound != newMuteSound) {
    mMuteSound = newMuteSound;
    emit muteSoundChanged(mMuteSound);
  }
}

int TBNTBMediaPlayer::repeatSoundMode()
{
	return repeatMode();
}

void TBNTBMediaPlayer::setRepeatSoundMode(int newRepeatSoundMode)
{
    switch(newRepeatSoundMode)
    {
    case bb::multimedia::RepeatMode::None:
        {
            setRepeatMode(bb::multimedia::RepeatMode::None);
            break;
        }
    case bb::multimedia::RepeatMode::Track:
        {
            setRepeatMode(bb::multimedia::RepeatMode::Track);
            break;
        }
    case bb::multimedia::RepeatMode::All:
        {
            setRepeatMode(bb::multimedia::RepeatMode::All);
            break;
        }
    default:
    {
        qWarning() << "TBNTBMediaPlayer::setRepeatSoundMode: wrong repeatMode " << newRepeatSoundMode;
        setRepeatMode(bb::multimedia::RepeatMode::None);
        break;
    }
    };
}
