#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "backend.h"
#include "senddata.h"
#include "recvdata.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    senddata send;
    recvdata recv;
    QQmlApplicationEngine engine;
    qmlRegisterType<BackEnd>("io.qt.examples.backend", 1, 0, "BackEnd");
    engine.rootContext()->setContextProperty("send", &send);
    engine.rootContext()->setContextProperty("recv", &recv);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
