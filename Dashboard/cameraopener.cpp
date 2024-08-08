// CameraOpener.cpp
#include "CameraOpener.h"
#include <QProcess>
#include <QDebug>

CameraOpener::CameraOpener(QObject *parent) : QObject(parent)
{
}

void CameraOpener::openCamera()
{
    QProcess process;
    process.start("start ms-camera:");
    process.waitForStarted();
    qDebug() << "Process started:" << process.state();
    process.waitForFinished();
    QByteArray output = process.readAllStandardOutput();
    QByteArray error = process.readAllStandardError();
    qDebug() << "Output:" << output;
    qDebug() << "Error:" << error;
}
