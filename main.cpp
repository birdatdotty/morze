#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "Morze.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    Morze* morze = new Morze;

    QQmlApplicationEngine engine;
    QJSValue jsMorze = engine.newQObject(morze);

    engine.rootContext()->setContextProperty("morze", morze);
    qmlRegisterSingletonType<Morze>("su.dotty.morze", 1, 0, "Morze", &Morze::qmlInstance);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
