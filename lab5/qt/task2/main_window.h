#ifndef TASK2_MAIN_WINDOW_H_
#define TASK2_MAIN_WINDOW_H_

#include <QMainWindow>
#include "ui_mainwindow.h"

class MainWindow : public QMainWindow {
private:
	Ui::MainWindow ui;

	QClipboard* clipboard;
	QPixmap pixmap;
protected:
	void resizeEvent(QResizeEvent* event) override;
	void dragEnterEvent(QDragEnterEvent* event) override;
	void dropEvent(QDropEvent* event) override;
public:
	MainWindow(QWidget* parent = nullptr);
	void UpdateClipImage();
	void SetTextToClipBoard();
public slots:
	void UpdateLabels();
};

#endif
