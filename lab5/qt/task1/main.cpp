#include <QApplication>
#include "mainwindow.h"

int main(int argc, char** argv) {
	QApplication app(argc, argv);
	MainWindow main_window1;
	MainWindow main_window2;

	main_window1.show();
	main_window2.show();

	return app.exec();
}

