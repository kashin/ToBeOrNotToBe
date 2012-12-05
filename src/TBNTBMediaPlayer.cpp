#include "TBNTBMediaPlayer.h"
#include <qdebug.h>

TBNTBMediaPlayer::TBNTBMediaPlayer(QObject * parent)
: bb::multimedia::MediaPlayer(parent),
  mMuteSound(false),
  mSettings(this)
{
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
