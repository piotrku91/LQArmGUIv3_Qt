#ifndef TVIEW_H
#define TVIEW_H
#include <QObject>


class TView {
public:
    QString m_Name;
    QString m_LQ1_Code;
    int m_LQ1_amount;
    QString m_LQ2_Code;
    int m_LQ2_amount;
    QString m_LQ3_Code;
    int m_LQ3_amount;
    QString m_LQ4_Code;
    int m_LQ4_amount;
    bool isLemon;

public:
    // Constructor
    TView(QString Name = "domyslny",
          QString LQ1_Code = "VOD1",
          int LQ1_amount = 500,
          QString LQ2_Code = "WHS1",
          int LQ2_amount = 599,
          QString LQ3_Code = "WO1",
          int LQ3_amount = 40,
          QString LQ4_Code = "BRAK",
          int LQ4_amount = 0,
          bool isLemon = false)
        : m_Name(Name),
          m_LQ1_Code(LQ1_Code),
          m_LQ1_amount(LQ1_amount),
          m_LQ2_Code(LQ2_Code),
          m_LQ2_amount(LQ2_amount),
          m_LQ3_Code(LQ3_Code),
          m_LQ3_amount(LQ3_amount),
          m_LQ4_Code(LQ4_Code),
          m_LQ4_amount(LQ4_amount),
          isLemon(isLemon){};
};


#endif // TVIEW_H
