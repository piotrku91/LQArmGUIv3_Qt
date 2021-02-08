#include "clock.h"



Clock::Clock(QObject *parent) :
    QObject(parent)
{

}

QString Clock::getTime()
{

    std::time_t t = std::time(nullptr);
    std::tm tm = *std::localtime(&t);
     std::ostringstream oss;
         oss << std::put_time(&tm, "%D %T");

    return QString::fromStdString(oss.str());

};


void Clock::getTimeDateSplitted(QString& Year, QString& Month, QString& Day, QString& DoW, QString& Hour, QString& Min, QString& Sec)
{



    std::time_t t = std::time(nullptr);
    std::tm tm = *std::localtime(&t);
     std::ostringstream oss;

    oss << std::put_time(&tm, "%y");
    Year= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%m");
    Month= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%d");
    Day= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%w");
    DoW= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%H");
    Hour= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%M");
    Min= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

    oss << std::put_time(&tm, "%S");
    Sec= QString::fromStdString(oss.str());
    oss.str("");
    oss.clear();

};



QString Clock::getDateReformated()
{

    std::time_t t = std::time(nullptr);
    std::tm tm = *std::localtime(&t);
     std::ostringstream oss;
         oss << std::put_time(&tm, "%m%d%y_%H%M%S");

    return QString::fromStdString(oss.str());

};





