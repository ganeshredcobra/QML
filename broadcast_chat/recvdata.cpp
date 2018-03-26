#include "recvdata.h"

recvdata::recvdata()
{
    udpSocket = new QUdpSocket(this);
    udpSocket->bind(45454, QUdpSocket::ShareAddress);
    connect(udpSocket, SIGNAL(readyRead()),
                this, SLOT(processPendingDatagrams()));
}

void recvdata::processPendingDatagrams()
{
//! [2]
    while (udpSocket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        udpSocket->readDatagram(datagram.data(), datagram.size());
        //statusLabel->setText(tr("Received datagram: \"%1\"")
         //                    .arg(datagram.data()));
        qDebug()<<"Received datagram on socket : "<<datagram.data();
        //setVal(datagram.data());
        setUname(datagram.data());
        setMsg(datagram.data());
    }
//! [2]
}

void recvdata::setVal(QString val)
{
    qDebug()<<"value Recvd is Recv data "<<val;
    //m_uname = val.split(";")[0].split("u:",QString::SkipEmptyParts)[0];
    //m_msg = val.split(";")[1].split("m:",QString::SkipEmptyParts)[0];
    qDebug()<<"uname is "<<m_uname;
    qDebug()<<"msg is "<<m_msg;
    if(val!=m_val)
        qDebug()<<"value set";
    m_val = val;
    emit valchanged();
}

void recvdata::setUname(QString val)
{
    m_uname = val.split(";")[0].split("u:",QString::SkipEmptyParts)[0];
    qDebug()<<"set Uname "<<m_uname;
    emit unamechanged();
}

void recvdata::setMsg(QString val)
{
    m_msg = val.split(";")[1].split("m:",QString::SkipEmptyParts)[0];
    qDebug()<<"set Msg "<<m_msg;
    emit msgchanged();
}

QString recvdata::getVal()
{
    qDebug()<<"value read "<<m_val;
    return m_val;
}

QString recvdata::getUname()
{
    qDebug()<<"value m_uname "<<m_uname;
    return m_uname;
}
QString recvdata::getMsg()
{
    qDebug()<<"value m_msg "<<m_msg;
    return m_msg;
}
