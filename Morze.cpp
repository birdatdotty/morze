#include "Morze.h"
#include <QMap>

#include "morzeAlphabet.h"

#include <QDebug>

Morze::Morze(QObject *parent)
    : QObject(parent)
{

}
#include <QDebug>
#include <QQmlEngine>
QString Morze::trans(QString str)
{
    QString ch;
    QString ret;
    for (int i = 0; i < str.size(); i++) {
        ch = str.at(i).toUpper();
        if (alphabetEn.contains(ch))
          ret += alphabetEn[ch];
        else if (alphabetRu.contains(ch))
          ret += alphabetRu[ch];
        ret += " ";
    }

    return ret;
}

QString Morze::reTrans(QString str, LANG lang)
{
    QStringList strSplit = str.split(" ");
    QString ret;
    if (lang == LANG::EN) {
        for (int i = 0; i < strSplit.size(); i++) {
            ret += alphabetReEn[strSplit.at(i)];
        }
    }
    else {
        for (int i = 0; i < str.size(); i++) {
            ret += alphabetReRU[str.at(i)];
            ret += " ";
        }
    }

    return ret;
}

QObject *Morze::qmlInstance(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    static Morze* morze = new Morze;
    return morze;
}

