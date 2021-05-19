#ifndef LAB06_MAIN_WINDOW_H_
#define LAB06_MAIN_WINDOW_H_

#include <QMainWindow>
#include <QSqlRelationalTableModel>
#include <QTableView>
#include <QSqlDatabase>

#include "sql_table.h"
#include "ui_main_window.h"

class MainWindow : public QMainWindow {
private:
	SqlTable* sql_table1;
	SqlTable* sql_table2;
	Ui::MainWindow ui;
public:
	MainWindow(QWidget* parent = nullptr);
	~MainWindow();

	QSqlDatabase OpenDb(QString name);
};

#endif

