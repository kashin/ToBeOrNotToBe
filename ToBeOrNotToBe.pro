TEMPLATE = app
TARGET = ToBeOrNotToBe

CONFIG += qt warn_on debug_and_release cascades

MOBILITY += sensors

INCLUDEPATH += ../src
SOURCES += ../src/*.cpp
HEADERS += ../src/*.hpp ../src/*.h

LIBS += -lbbmultimedia
LIBS += -lbbdevice
LIBS += -lcamapi

lupdate_inclusion {
    SOURCES += ../assets/*.qml
    SOURCES += ../assets/Ball/*.qml
    SOURCES += ../assets/AskRandom/*.qml
}

device {
	CONFIG(release, debug|release) {
		DESTDIR = o.le-v7
	}
	CONFIG(debug, debug|release) {
		DESTDIR = o.le-v7-g
	}
}

simulator {
	CONFIG(release, debug|release) {
		DESTDIR = o
	}
	CONFIG(debug, debug|release) {
		DESTDIR = o-g
	}
}

OBJECTS_DIR = $${DESTDIR}/.obj
MOC_DIR = $${DESTDIR}/.moc
RCC_DIR = $${DESTDIR}/.rcc
UI_DIR = $${DESTDIR}/.ui

TRANSLATIONS = \
    $${TARGET}_en_GB.ts \
    $${TARGET}_ru.ts \
    $${TARGET}.ts
