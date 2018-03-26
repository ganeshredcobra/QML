#ifndef SENDDATA_H
#define SENDDATA_H

#include <QObject>
#include <QTimer>
#include <QUdpSocket>
#include <QDebug>

class senddata : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString val READ getVal WRITE setVal NOTIFY valchanged)

public:

    QString getVal();
    void setVal(QString val);
    //sendVal();


    senddata();
    int messageNo;
    void broadcastDatagram(int num);
    void broadcastStringData(QString data);

    QUdpSocket *udpSocket;
    QTimer *timer;

signals:
    void valchanged();

private:
    QString m_val;

};
#endif // SENDDATA_H
