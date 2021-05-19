#ifndef SQL_TABLE_WIDGET_H_
#define SQL_TABLE_WIDGET_H_

#include <QWidget>
#include <QSqlRelationalTableModel>
#include <QTableView>
#include <QVBoxLayout>

class SqlTable : public QWidget {
private:
	QSqlDatabase* db = nullptr;
	QSqlRelationalTableModel* model = nullptr;
	QTableView* view = nullptr;

	QVBoxLayout* layout;
public:
	SqlTable(QWidget* parent = nullptr);
	void SetDatabase(QString db_file, QString db_name,
										QString connection_name);
	void SetRelation(int column, QString source_table, 
						QString p_key_source, QString source_column);
	void AddRow();
	void Select();
};

#endif

