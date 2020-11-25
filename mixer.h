#ifndef MIXER_H
#define MIXER_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <iostream>
#include <vector>


class TView
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


class Mixer: public QObject
{
    TView Debugtmp;
    TView * ActualView;




    Q_OBJECT





public:
    explicit Mixer(QObject *parent = nullptr);
    const QStringList *ListPtr;






    public slots:
    QStringList getList();

signals:
    void itemIndexChanged();
    QString pushUpdate();


private:


};

#endif // MIXER_H
