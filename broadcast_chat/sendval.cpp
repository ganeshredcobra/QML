#include "sendval.h"
#include <QDebug>

sendVal::sendVal()
{
    m_val = 0;
}

void sendVal::setVal(int val)
{
    if(val!=m_val)
        qDebug()<<"value set";
}

int sendVal::getVal()
{
    qDebug()<<"value read";
    return m_val;
}
