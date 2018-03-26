#ifndef RECVDATA_H
#define RECVDATA_H

#include <QObject>
#include <QUdpSocket>

class recvdata : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString val READ getVal WRITE setVal NOTIFY valchanged)
    Q_PROPERTY(QString uname READ getUname  WRITE setUname NOTIFY unamechanged)
    Q_PROPERTY(QString msg READ getMsg  WRITE setMsg NOTIFY msgchanged)

public:
    QString getVal();
    QString getUname();
    QString getMsg();
    void setVal(QString val);
    void setUname(QString val);
    void setMsg(QString val);

    recvdata();

    QUdpSocket *udpSocket;

public slots:
    void processPendingDatagrams();

signals:
    void valchanged();
    void unamechanged();
    void msgchanged();

private:
    QString m_val;
    QString m_uname;
    QString m_msg;

};

#endif // RECVDATA_H
