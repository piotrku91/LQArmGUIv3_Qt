#include "mixer.h"

Mixer::Mixer(QObject *parent) :
    QObject(parent)
{

}



QStringList Mixer::getTest()
{

    return {"one","two","three"};

}


int Mixer::itemIndex()
{
    return m_itemIndex;
}

void Mixer::setItemIndex(const int &itemIndex)
{
    if (itemIndex == m_itemIndex)
        return;

    m_itemIndex =itemIndex;
    emit itemIndexChanged();
}



