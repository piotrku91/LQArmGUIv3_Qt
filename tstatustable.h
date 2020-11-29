#ifndef TSTATUSTABLE_H
#define TSTATUSTABLE_H

#include <QObject>


class TGlassInfo
{
public:
    int MaxCap;
    bool Locked;
    QString DrinkScheme;

    TGlassInfo():MaxCap(50),Locked(false),DrinkScheme("default") {}


};

class TStatusTable : public QObject
{
    Q_OBJECT
public:
    explicit TStatusTable(QObject *parent = nullptr);

public:
    TGlassInfo Glass[5];

    void ImportFromParams();
    void DrinkSchemeChanged();




signals:

};

#endif // TSTATUSTABLE_H
