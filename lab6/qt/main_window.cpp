#include "main_window.h"
#include "qnamespace.h"

#define DATABASE_FILE "test.db"

MainWindow::MainWindow(QWidget* parent) :
	QMainWindow(parent),
	sql_table1(new SqlTable(this)),
	sql_table2(new SqlTable(this))
{
	ui.setupUi(this);	

	sql_table1->SetDatabase("test.db", "Product", "c1");
	sql_table2->SetDatabase("test.db", "Order_", "c2");
	sql_table2->SetRelation(1, "Product", "code", "name");

	sql_table1->Select();
	sql_table2->Select();

	connect(ui.actionAdd_row, &QAction::triggered, 
			sql_table1, &SqlTable::AddRow);
	connect(ui.actionAdd_row_2, &QAction::triggered, 
			sql_table2, &SqlTable::AddRow);

	ui.mdiArea->addSubWindow(sql_table1);
	ui.mdiArea->addSubWindow(sql_table2);
}

MainWindow::~MainWindow() {}

QSqlDatabase MainWindow::OpenDb(QString name) {
	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName(name);
	db.setHostName("localhost");
	db.open();

	return db;
}

