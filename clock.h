#ifndef CLOCK_H
#define CLOCK_H
#include <QObject>
#include <ctime>
#include <iomanip>
#include <sstream>
#include <iostream>

class Clock: public QObject
{
    Q_OBJECT
public:
    explicit Clock(QObject *parent = nullptr);


    public slots:
    QString getTime();
    QString getDateReformated();
    void getTimeDateSplitted(QString& Year, QString& Month, QString& Day, QString& DoW, QString& Hour, QString& Min, QString& Sec);

};

#endif // CLOCK_H
