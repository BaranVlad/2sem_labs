#ifndef LAB4_MAINWINDOW_H_
#define LAB4_MAINWINDOW_H_

#include <QMainWindow>
#include <QMdiArea>
#include <QMdiSubWindow>
#include <QLabel>
#include <QString>
#include <QPushButton>

#include "tree_widget.h"
#include "enter_data.h"

#include "ui_mainwindow.h"

class MainWindow : public QMainWindow {
	Q_OBJECT
private:
	Ui::MainWindow* ui;
	QMdiArea* mdi_area;

	TreeWidget* tree_widget;
	EnterData* new_path;
	EnterData* save_file;
	EnterData* upload_file;

	QLabel* permanent_label;
protected:
	void dropEvent(QDropEvent* event) override;
	void dragEnterEvent(QDragEnterEvent* event) override;
public:
	MainWindow(QWidget* parent = nullptr);	
	~MainWindow();	

	void InitNewSubWindow(QAction* show_action, QPushButton* tool_button,
		   	QWidget* internal_widget, bool is_hidden = false);
public slots:
	void SaveToFile(const std::string& file_name);
	void UploadFromFile(const std::string& file_name);
};

#endif

