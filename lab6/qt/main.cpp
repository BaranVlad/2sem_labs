#include <QApplication>
#include <QDebug>
#include "main_window.h"

int main(int argc, char** argv) {
	QApplication app(argc, argv);

	QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
	db.setDatabaseName("test.db");
	db.setHostName("localhost");
	qDebug() << db.open();

	MainWindow main_window;
	main_window.show();

	return app.exec();
}

