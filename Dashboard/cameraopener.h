// CameraOpener.h
#ifndef CAMERAOPENER_H
#define CAMERAOPENER_H

#include <QObject>

class CameraOpener : public QObject
{
    Q_OBJECT
public:
    explicit CameraOpener(QObject *parent = nullptr);

public slots:
    void openCamera();
};

#endif // CAMERAOPENER_H
