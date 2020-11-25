#ifndef MIXER_H
#define MIXER_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <iostream>


class Mixer: public QObject
{

    Q_OBJECT
        Q_PROPERTY(int itemIndex READ itemIndex WRITE setItemIndex NOTIFY itemIndexChanged)

    struct ActualView
    {
    public:
        QString  Name="test";
        QString LQ1_Code="a";
        int LQ1_amount=500;
        QString LQ2_Code="b";
        int LQ2_amount=600;
        QString LQ3_Code="c";
        int LQ3_amount=100;
        QString LQ4_Code="d";
        int LQ4_amount=1200;
    };

public:
    explicit Mixer(QObject *parent = nullptr);
    const QStringList *ListPtr;


    int itemIndex();
    void setItemIndex(const int &itemIndex);


    public slots:
    QStringList getTest();

signals:
    void itemIndexChanged();
    QString pushUpdate();


private:
    int m_itemIndex;

};

#endif // MIXER_H
