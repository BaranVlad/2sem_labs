/********************************************************************************
** Form generated from reading UI file 'main_window.ui'
**
** Created by: Qt User Interface Compiler version 5.13.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAIN_WINDOW_H
#define UI_MAIN_WINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMdiArea>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionAdd_row;
    QAction *actionAdd_row_2;
    QWidget *centralwidget;
    QFormLayout *formLayout;
    QMdiArea *mdiArea;
    QMenuBar *menubar;
    QMenu *menuProduct;
    QMenu *menuOrder;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        actionAdd_row = new QAction(MainWindow);
        actionAdd_row->setObjectName(QString::fromUtf8("actionAdd_row"));
        actionAdd_row_2 = new QAction(MainWindow);
        actionAdd_row_2->setObjectName(QString::fromUtf8("actionAdd_row_2"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        formLayout = new QFormLayout(centralwidget);
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        mdiArea = new QMdiArea(centralwidget);
        mdiArea->setObjectName(QString::fromUtf8("mdiArea"));

        formLayout->setWidget(0, QFormLayout::LabelRole, mdiArea);

        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 22));
        menuProduct = new QMenu(menubar);
        menuProduct->setObjectName(QString::fromUtf8("menuProduct"));
        menuOrder = new QMenu(menubar);
        menuOrder->setObjectName(QString::fromUtf8("menuOrder"));
        menuOrder->setToolTipsVisible(false);
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        menubar->addAction(menuProduct->menuAction());
        menubar->addAction(menuOrder->menuAction());
        menuProduct->addAction(actionAdd_row);
        menuOrder->addAction(actionAdd_row_2);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        actionAdd_row->setText(QCoreApplication::translate("MainWindow", "Add row", nullptr));
        actionAdd_row_2->setText(QCoreApplication::translate("MainWindow", "Add row", nullptr));
        menuProduct->setTitle(QCoreApplication::translate("MainWindow", "Product", nullptr));
        menuOrder->setTitle(QCoreApplication::translate("MainWindow", "Order", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAIN_WINDOW_H
