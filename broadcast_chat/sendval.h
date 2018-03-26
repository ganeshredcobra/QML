#ifndef SENDVAL_H
#define SENDVAL_H
#include<QObject>


class sendVal : public QObject
{
Q_OBJECT
public:
    Q_PROPERTY(int val READ getVal WRITE setVal NOTIFY valchanged)

    int getVal();
    void setVal(int val);
    sendVal();

signals:
    void valchanged();

private:
    int m_val;
};

#endif // SENDVAL_H
