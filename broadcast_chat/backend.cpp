#include "backend.h"

BackEnd::BackEnd(QObject *parent) :
    QObject(parent)
{
    QString uname = qgetenv("USER");
    setUserName(uname);
    num=9;
}

QString BackEnd::userName()
{
    return m_userName;
}

void BackEnd::setUserName(const QString &userName)
{
    num++;
    if (userName == m_userName)
        return;

    qDebug()<<"Recvd data in cpp is : "<<userName;
    //bData.broadcastDatagram(num);
    m_userName = userName;
    emit userNameChanged();
}
