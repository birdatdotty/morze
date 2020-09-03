#ifndef MORZE_H
#define MORZE_H

#include <QObject>
#include <QString>
#include <QQmlEngine>

// https://ru.wikipedia.org/wiki/Азбука_Морзе
class Morze: public QObject
{
    Q_OBJECT
public:
    enum LANG{RU,EN};
    Q_ENUMS(LANG)
    Morze(QObject *parent = nullptr);
    Q_INVOKABLE QString trans(QString str);
    Q_INVOKABLE QString reTrans(QString str, LANG lang);

    static QObject *qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine);
};

#endif // MORZE_H
