#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cameraopener.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Create an instance of CameraOpener
    CameraOpener cameraOpener;

    // Expose CameraOpener instance to QML
    engine.rootContext()->setContextProperty("cameraOpener", &cameraOpener);

    const QUrl url(QStringLiteral("qrc:/Dashboard/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
