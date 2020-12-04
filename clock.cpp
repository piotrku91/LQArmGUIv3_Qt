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

}

QString Clock::getDateReformated()
{

    std::time_t t = std::time(nullptr);
    std::tm tm = *std::localtime(&t);
     std::ostringstream oss;
         oss << std::put_time(&tm, "%m%d%y_%H%M%S");

    return QString::fromStdString(oss.str());

}





