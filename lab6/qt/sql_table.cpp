#include "sql_table.h"

#include <QSqlRelationalDelegate>

SqlTable::SqlTable(QWidget* parent) :
	QWidget(parent)
{
	layout = new QVBoxLayout(this);
	setLayout(layout);
}

void SqlTable::SetDatabase(QString db_file, QString db_name,
										QString connection_name) 
{
	if (model) {
		delete model;
	}
	if (view) {
		delete view;
	}
	if (db) {
		delete db;
	}

	db = new QSqlDatabase(
			QSqlDatabase::addDatabase("QSQLITE", connection_name));
	db->setDatabaseName(db_file);
	db->setHostName("localhost");
	db->open();

	model = new QSqlRelationalTableModel(this, *db);
	view = new QTableView(this);


	model->setTable(db_name);
	model->setEditStrategy(QSqlTableModel::OnRowChange);

	view->setModel(model);
	layout->addWidget(view);
	view->setItemDelegate(new QSqlRelationalDelegate(view));
}

void SqlTable::SetRelation(int column, QString source_table, 
						QString p_key_source, QString source_column)
{
	model->setRelation(column, QSqlRelation(source_table, 
									p_key_source, source_column));
}

void SqlTable::Select() {
	model->select();
}

void SqlTable::AddRow() {
	int row = model->rowCount();
	model->insertRow(row);
}
