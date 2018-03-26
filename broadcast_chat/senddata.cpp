#include "senddata.h"

senddata::senddata()
{
    //timer = new QTimer(this);
    //! [0]
        udpSocket = new QUdpSocket(this);
    //! [0]
        messageNo = 1;

        m_val = "Hello";
}

void senddata::broadcastDatagram(int num)
{
    QByteArray datagram = "Broadcast message " + QByteArray::number(num);
    udpSocket->writeDatagram(datagram.data(), datagram.size(),
                             QHostAddress::Broadcast, 45454);
    ++messageNo;
}

void senddata::broadcastStringData(QString data)
{
    QByteArray datagram = /*"Broadcast message " + */data.toLocal8Bit();
    qDebug()<<"string datagram to send socket "<<datagram;
    udpSocket->writeDatagram(datagram.data(), datagram.size(),
                             QHostAddress::Broadcast, 45454);
    ++messageNo;
}

void senddata::setVal(QString val)
{
    qDebug()<<"value Recvd is send data "<<val;
    broadcastStringData(val);
    if(val!=m_val)
        qDebug()<<"value set";
    emit valchanged();
}

QString senddata::getVal()
{
    qDebug()<<"value read "<<m_val;
    return m_val;
}
